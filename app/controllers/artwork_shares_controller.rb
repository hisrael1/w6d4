class ArtworkSharesController < ApplicationController

  def index
    @artwork_shares = ArtworkShare.all
    render json: @artwork_shares
    # render json: User.find(params[:user_id]).artworks
  end

  def show
    @artwork_share = ArtworkShare.find(params[:id])
    render json: @artwork_share
  end

  def create
    @artwork_share = ArtworkShare.new(artwork_share_params)
    if @artwork_share.save
      redirect_to artwork_share_url(@artwork_share)
    else
      render json: @artwork_share.errors.full_messages
    end
  end

  def destroy
    @artwork_share = ArtworkShare.find(params[:id])
    @artwork_share.destroy
    redirect_to artwork_shares_url
  end

  private
  
  def artwork_share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end

end