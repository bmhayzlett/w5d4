class CatRentalRequestsController < ApplicationController

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
    if @cat_rental_request.save
      redirect_to cat_url(Cat.find_by(id: @cat_rental_request.cat_id))
    else
      render :new
    end
  end

  def new
    @cat_rental_request = CatRentalRequest.new
    render :new
  end

  def update
    @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
    if @cat_rental_request.update(cat_rental_request_params)
      redirect_to cat_url(Cat.find_by(id: @cat_rental_request.cat_id))
    else
      render :edit
    end
  end

  def edit
    @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
    if @cat_rental_request
      render :edit
    end
  end

  def destroy
    @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
    cat_id = @cat_rental_request.nil? ? nil : @cat_rental_request.cat_id
    if @cat_rental_request.delete
      redirect_to cat_url(Cat.find_by(id: cat_id))
    else
      redirect_to cats_url
    end
  end

  def approve
    CatRentalRequest.find_by(id: params[:id]).approve! unless CatRentalRequest.find_by(id: params[:id]).nil?
    redirect_to cat_url(Cat.find_by(id: CatRentalRequest.find_by(id: params[:id]).cat_id))
  end

  def deny
    CatRentalRequest.find_by(id: params[:id]).deny! unless CatRentalRequest.find_by(id: params[:id]).nil?
    redirect_to cat_url(Cat.find_by(id: CatRentalRequest.find_by(id: params[:id]).cat_id))
  end

  private
  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end
end
