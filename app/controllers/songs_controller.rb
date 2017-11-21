class SongsController < ApplicationController
  before_action :redirect_unless_logged_in, except: [:index, :show]
  before_action :find_song, only: [:show, :edit, :update, :destroy]
  before_action -> { redirect_unless_owner(@song.user) }, only: [:edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      current_user.songs << @song
      redirect_to root_path
    else
      @errors = @song.errors.full_messages
      render :new
    end
  end

  def update
    if @song.update(song_params)
      redirect_to root_path
    else
      @errors = @song.errors.full_messages
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to root_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist)
  end

  def find_song
    @song = Song.find_by(id: params[:id])
  end
end
