class ImagesController < ApplicationController
  before_action :set_image, only: %i[show destroy]
  before_action :set_collection, only: %i[show new create]

  # def index
  #   @images = Image.all
  # end

  def show
    @image.collection = @collection
  end

  def new
    @image = Image.new
  end

  def create
    @image1 = Image.build(image_params)
    num = @image1.photos.count
    num.times do |i|
      #   @images = []
      #   @image = Image.new(image_params)
      #   @images << @image.as_json
      # end
      # @images.each do |image|
      # params = image_params[:photos][i + 1]
      params = ActionController::Parameters.new(collection_id: image_params[:collection_id],
                                                photos: [image_params[:photos][i + 1]])
      params.permit!
      @image = Image.build(params)
      if @image.save == false
        # break
        render :new, status: :unprocessable_entity
      end
    end
    # raise
    redirect_to collection_path(@collection)
    # @image = Image.create(@images)
    # @image.collection = @collections
  end

  # def edit
  # end

  # def update
  #   if @image.update(image_params)
  #     redirect_to root_path, notice: "Task updated"
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @image.destroy
    redirect_to root_path, status: :see_other, notice: "images deleted"
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def image_params
    params.require(:image).permit(:collection_id, photos: [])
  end
end
