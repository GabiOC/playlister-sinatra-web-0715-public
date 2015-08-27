class SongsController < ApplicationController
  get '' do
    @songs = Song.all
    erb :"songs/index"
  end
end
