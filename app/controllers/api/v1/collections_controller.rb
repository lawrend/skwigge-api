module Api::V1

  
  class CollectionsController < BaseController
    before_action :set_collection, only: [:show, :update, :destroy]

    # GET /collections
    def index
      respond_with Collection.get_enigma_collections
      
      # @collections = Collection.all
      # self.collections
      # render json: @collections
    end

    # GET /collections/1
    def show
      render json: @collection
    end

    # POST /collections
    def create
      @collection = Collection.new(collection_params)

      if @collection.save
        render json: @collection, status: :created, location: @collection
      else
        render json: @collection.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /collections/1
    def update
      if @collection.update(collection_params)
        render json: @collection
      else
        render json: @collection.errors, status: :unprocessable_entity
      end
    end

    # DELETE /collections/1
    def destroy
      @collection.destroy
      if @collection.destroy
        head :no_content, status: :ok
      else 
        render json: @collection.errors, status: :unprocessable_entity
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def collection_params
      params.require(:collection).permit(:title, :description)
    end
  end
end
