class ImagesController < ApplicationController
  before_action :set_image, only: %i[show edit update destroy]

  def index
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    @image.photos.each do
      if @image.save
        redirect_to root_path, notice: "Images Added"
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @image.update(image_params)
      redirect_to root_path, notice: "Task updated"
    else
      render :edit
    end
  end

  def destroy
    @image.destroy
    redirect_to root_path, status: :see_other, notice: "images deleted"
  end

  private

  def set_image
    @image = image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:photo)
  end
end
