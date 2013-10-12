class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    #This is where all indexing will need to happen!!!!
    #@movies = Movie.all #Original Code: this just displays all
    #@movies = Movie.order(params[:sort]) #this takes movies and uses the order function with sort parameters to reorder and diplay the list

    @movies = Movie.all
    @all_ratings = ['G', 'PG', 'PG-13', 'R']
    @redirect = 0

    if(@checked != nil)
      @movies = @movies.find_all{ |m| @checked.has_key?(m.rating) and @checked[m.rating]==true}
    elsif(session[:ratings] == nil and params[:ratings] == nil)
      @all_ratings.each { |rating| }
        ratings[:rating]

  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
