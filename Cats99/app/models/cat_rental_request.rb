class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: ["PENDING", "APPROVED", "DENIED"]
  validate :overlapping_approved_requests
  validate :chronologically_correct

  def overlapping_approved_requests
    if Cat.find_by(id: cat_id)
      if rental_requests = CatRentalRequest.where(cat_id: self.cat_id, status: "APPROVED")
        overlap = overlapping_requests(rental_requests)
        if self.status == "APPROVED" && !overlap.nil? && overlap.any? { |request| request.status == "APPROVED" }
          errors[:start_date] << "This request overlaps another request."
        end
      end
    else
      errors[:start_date] << "This request is for a nonexistent cat."
    end
  end

  def overlapping_requests(rental_requests)
    return nil if rental_requests.nil?
    rental_requests.select do |request|
      !((self.start_date < request.start_date &&
      self.end_date < request.start_date) ||
      (self.start_date > request.end_date &&
      self.end_date > request.end_date) ||
      self.id == request.id)
    end
  end

  def chronologically_correct
    unless (end_date - start_date) > 0
      errors[:start_date] << "This request is not chronologically correct."
    end
  end

  def approve!
    rental_requests = CatRentalRequest.where(cat_id: self.cat_id)
    overlap = overlapping_requests(rental_requests)
    self.status = "APPROVED" if overlap.nil? || !(overlap.any? { |request| request.status == "APPROVED" })
    unless overlap.nil?
      overlap.each do |request|
        request.deny! if request.status == "PENDING"
      end
    end
    self.save!
  end

  def deny!
    self.status = "DENIED"
    self.save!
  end

  belongs_to :cat,
    dependent: :destroy
end
