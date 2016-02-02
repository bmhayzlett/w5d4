class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    if @cat = Cat.find_by(id: params[:id])
      render :show
    else
      redirect_to cats_url
    end
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :edit
    else
      render :index
    end
  end

  def destroy
    @cat = Cat.find_by(id: params[:id])
    if @cat.delete
      index
    else
      render :show
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :color, :birth_date, :sex, :description)
  end
end
