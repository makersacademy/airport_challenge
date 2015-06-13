require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 5
  DEFAULT_WEATHER = true

  def initialize
    @planes=[]
    @capacity = DEFAULT_CAPACITY
    @weather = DEFAULT_WEATHER
  end

  def check_the_weather
    random = rand(3)
    @weather = false if random == 1
    return @weather
  end


  def instruct_plane
    return print "\n\n*****   Route assigned, weather is sunny, plane authorized to take off   *****\n\n".upcase if @weather
    return print "\n\n*****   WARNING!! Weather is stormy, plane is not authorized to take off   *****\n\n".upcase if !@weather
  end

  def release_plane planes
    planes.pop
  end

  def landing
  end


end

