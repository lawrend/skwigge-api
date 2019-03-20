module Api::V1

  
  class CollectionsController < ApplicationController
    before_action :set_collection, only: [:show, :update, :destroy]

    def collections
      conn = Faraday.new "https://rijksmuseum.nl/"
      @culture="en"
      @objnum="SK-C-5"
      # conn = Faraday.new "https://rijksmuseum.nl/api/#{@culture}/collection/#{@objnum}"
      resp = conn.get "en/api/collection/#{@objnum}?format=json&key=#{ENV['MUSEUM_API_KEY']}" 
      @thisthing = resp.body

      # conn = Faraday.new(:url => "https://rijksmuseum.nl/api/en/") do |faraday|
      #   faraday.request :url_encoded
      #   faraday.response :logger
      #   faraday.adapter Faraday.default_adapter
      #   faraday.params['key'] = ENV['MUSEUM_API_KEY']
      # end
      # # resp = conn.get do |req|
      #   req.params['imgonly'] = 'True'
      #   req.params['format'] = 'json'
      #   req.params['key'] = ENV['MUSEUM_API_KEY']
      # end
      # @collections = conn.body
      # render json: @collections
    end

    # GET /collections
    def index
      getstuff = Collection.get_enigma
      render json: getstuff

      # resp = Faraday.get "https://rijksmuseum.nl/api/en/collection/SK-C-5?key=Pm44XICe&format=json" 
      # @thisthing = resp.body
      # render json: @thisthing 
      

      # conn = Faraday.new(:url => "https://rijksmuseum.nl/") do |faraday|
      #   faraday.request :url_encoded
      #   faraday.response :logger
      #   faraday.adapter Faraday.default_adapter
      # end

      # conn = Faraday.new "https://rijksmuseum.nl/"
      # @culture="en"
      # @objnum="SK-C-5"
      # # conn = Faraday.new "https://rijksmuseum.nl/api/#{@culture}/collection/#{@objnum}"
      # resp = conn.get "en/api/collection/#{@objnum}?format=json&key=#{ENV['MUSEUM_API_KEY']}" 
      # @thisthing = resp.body
      
      # render json: @thisthing 

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
