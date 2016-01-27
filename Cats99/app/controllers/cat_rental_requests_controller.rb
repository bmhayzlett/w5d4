class CatRentalRequestRentalRequestsController < ApplicationController
  def index
    @cat_rental_requests = CatRentalRequest.all
    render :index
  end

  def show
    if @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
      render :show
    else
      redirect_to cat_rental_requests_url
    end
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
    if @cat_rental_request.save
      redirect_to cat_rental_request_url(@cat_rental_request)
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
      redirect_to cat_rental_request_url(@cat_rental_request)
    else
      render :edit
    end
  end

  def edit
    @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
    if @cat_rental_request
      render :edit
    else
      render :index
    end
  end

  def destroy
    @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
    if @cat_rental_request.delete
      index
    else
      render :show
    end
  end

  private
  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end
end
