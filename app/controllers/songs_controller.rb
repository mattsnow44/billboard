class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show
  end

  def new
    @song = Song.new
    render partial: 'form'
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to artist_path(@artist)
    else
      render partial: 'form'
    end
  end

  def edit
  end
  private
  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
  def set_song
    @song = Song.find(params[:id])
  end
  def song_params
      params.require(:song).permit(:title, :chart_no)
    end
end
