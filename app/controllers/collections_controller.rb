class CollectionsController < ApplicationController
  # before_action :set_collection, only: %i[edit update]

  def index
    @collections = Collection.all
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)

    if @collection.save
      redirect_to collections_path, notice: "Collection created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:season, :match, photos: [])
  end
end
