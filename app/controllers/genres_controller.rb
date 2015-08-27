class GenresController < ApplicationController
  get '' do
    @genres = Genre.all
    erb :"genres/index"
  end

  get "/:slug" do
    @genre = Genre.find_by_slug(params[:slug])
    erb :"genres/show"
  end
end
