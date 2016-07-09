class AlbumsController < ApplicationController

  before_action :require_user!

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      @band = @album.band
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      @band = @album.band
      render :edit
    end
  end

private

  def album_params
    params.require(:album).permit(:band_id, :live, :name, :year)
  end
end
