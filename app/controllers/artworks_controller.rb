class ArtworksController < ApplicationController

  def index
    if params.has_key?(:user_id)
      @artworks = Artwork.where(artist_id: params[:user_id])
      # @artworks = User.find(params[:user_id]).artworks
    else
      @artworks = Artwork.all
    end
    render json: @artworks
  end

end