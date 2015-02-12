class AlbumsController < ApplicationController
  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @album = Album.new
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      @bands = Band.all
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    @bands = Band.all
    render :edit
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      @bands = Band.all
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy!
    redirect_to band_url(@album.band)
  end

  private
  def album_params
    params.require(:album).permit(:title, :band_id, :studio)
  end
end
