require_relative './weather'

class Airport

  attr_reader :weather

  def initialize
    @weather = Weather.new
  end

  def clear?

  end

  # def weather
  #   Weather.new
  # end

end