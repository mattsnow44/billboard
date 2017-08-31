class ChartsController < ApplicationController
before_action :set_chart, only: [:show, :edit, :update, :destroy, :new_song, :add_song, :delete_song]

  def index
    @charts = Chart.all
  end

  def show
  end

  def new
    @chart = Chart.new
    render partial: 'form'
  end

  def create
    @chart = Chart.new(chart_params)
    if @chart.save
      redirect_to root_path
    else
      render partial: 'form'
    end
  end

  def edit
  end

  def new_song
    @songs = Song.all.where(chart_id: nil)
  end

  def add_song
  	@chart.songs << Song.find(params[:song_id])
    redirect_to chart_path(@chart)
  end

  def delete_song
    Song.find(params[:song_id]).update(chart_id: nil)
    redirect_to chart_path(@chart)
  end

  private
    def set_chart
      @chart = Chart.find(params[:id])
    end
    def chart_params
      params.require(:chart).permit(:name)
    end
end
