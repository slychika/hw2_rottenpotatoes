module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end

  def ratingsInclude(ratingName)
    @checked_ratings.include?(ratingName) ? true : false
  end
  
  def createParamsArray(sortColumn)
    @paramsArray = Hash.new
    @paramsArray.merge!({:ratings => @checked_ratings_hash})
    @paramsArray.merge!({:sort_by => sortColumn})
    @paramsArray
  end
end
