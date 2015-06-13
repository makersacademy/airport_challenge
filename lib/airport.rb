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
    return print "Route assigned, weather is sunny, plane authorized to take off" if @weather
    return print "WARNING!! Weather is stormy, plane is not authorized to take off" if !@weather
  end

  def release_plane
  end


end
