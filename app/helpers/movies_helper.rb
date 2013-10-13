module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  # this is to just to get rid of repeating ourselves - checks for what box has been clicked on
  def ratingsInclude(ratingName)
    @checked_ratings.include?(ratingName) ? true : false
  end
  # creates our array so that we can sort in the haml and the movies_controlers
  def createParamsArray(sortColumn)
    @paramsArray = Hash.new
    @paramsArray.merge!({:ratings => @checked_ratings_hash})
    @paramsArray.merge!({:sort_by => sortColumn})
    @paramsArray
  end
end
