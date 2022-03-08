class Show < ActiveRecord::Base

  # returns the highest value in the ratings column
  def self.highest_rating
    self.maximum(:rating)
  end

  #ASC is not needed after default because that it the default. Show.order("rating ASC").last also works
  # Returns the show with the highest rating
  def self.most_popular_show
    self.order(:rating).last
  end

  # Returns the lowest value in the ratings column.
  def self.lowest_rating
    self.minimum(:rating)
  end

  # Returns the show with the lowest rating.
  def self.least_popular_show
    self.order(rating: :asc).first
  end

  # Returns the sum of all of the ratings.
  def self.ratings_sum
    self.sum("rating")
  end

  # Returns a list of all of the shows that have a rating greater than 5.
  def self.popular_shows
    self.where("rating > ?", 5)
  end

  # Returns an array of all of the shows sorted in alphabetical order according to their names.
  def self.shows_by_alphabetical_order
    self.order("name ASC")
  end

end