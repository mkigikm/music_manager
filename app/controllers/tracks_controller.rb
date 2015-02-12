class TracksController < ApplicationController
  def show
    @track = Track.find(params[:id])
    render :show
  end

  def new
    @track = Track.new
    @albums = Album.all
  end

  def create
    @track = Track.new(track_params)
    @albums = Album.all

    if @track.save
      redirect_to track_url(@track)
    else
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    @albums = Album.all
    render :edit
  end

  def update
    @track = Track.find(params[:id])

    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      @albums = Album.all
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy!
    redirect_to band_url(@track.band)
  end

  private
  def track_params
    params.require(:track).permit(:title, :album_id, :bonus, :lyrics)
  end
end
