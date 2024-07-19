class CollectionsController < ApplicationController
  before_action :set_collection, only: %i[show edit update]

  def index
    @collections = Collection.all
  end

  def show
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = current_user.collections.build(collection_params)

    if @collection.save
      redirect_to collections_path, notice: "Collection created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:season, :match, photos: [])
  end
end
