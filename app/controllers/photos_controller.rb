class PhotosController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @photos = Photo.all
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to photos_path, notice: "Photos Added"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to photos_path, notice: "Task updated"
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to photos_path, status: :see_other, notice: "Photos deleted"
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:season, :match)
  end
end
