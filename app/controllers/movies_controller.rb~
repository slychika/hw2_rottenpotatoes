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

    @all_ratings = ['G', 'PG', 'PG-13', 'R']
    shouldRedirect = false
    #discussed with many people, andrea helped me get here
    if params[:sort_by] == nil
      if session[:sort_by] != nil
        @sorted_field = session[:sort_by].to_s
        shouldRedirect = true
      end
    else
      @sorted_field = params[:sort_by].to_s
    end
    
    if params[:ratings] == nil
      if session[:ratings] != nil
        @checked_ratings_hash = session[:ratings]
        shouldRedirect = true
      end
    else
      @checked_ratings_hash = params[:ratings]
    end
    
    if @checked_ratings_hash != nil
      session.merge!({ :ratings => @checked_ratings_hash })
    end
    
    if @sorted_field != nil
      session.merge!({ :sort_by => @sorted_field })
    end
    
    if shouldRedirect == true
      newParams = Hash.new
      newParams.merge!({ :ratings => @checked_ratings_hash })
      newParams.merge!({ :sort_by => @sorted_field })
      redirect_to movies_path(newParams)
    end
    
    @checked_ratings = @checked_ratings_hash != nil ? @checked_ratings_hash.keys : [] #makes sure that the checked boxes match the stuff showing
    @search_ratings = @checked_ratings.empty?() ? @all_ratings : @checked_ratings # sets them all to checked in the begining
    @movies = Movie.find_all_by_rating(@search_ratings, :order => @sorted_field) #allows you to have sorted movies
    @highlight = @sorted_field #acts with the haml, makes sure the right collumn is highlighted
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
