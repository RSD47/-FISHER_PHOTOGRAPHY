class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Colection.new(collection_params)

    if @collection.save
      redirect_to collections_path, notice: "Task created"
    else
      render :new
    end
  end

  private

  def collection_parasm
    params.require(:collection).permit(:season, :match)
  end
end
