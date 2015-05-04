class Airport

  attr_accessor :capacity

  def initialize (capacity=20)
    @capacity = capacity
    @planes = []
  end

  def land (plane)
    # check capacity
    fail 'Airport full' if @planes.count >= @capacity
    # check weather
    fail 'Stormy weather' if weather_check == :stormy
    # add plane to airport roster, let calling function know to change plane status
    @planes << plane
    # return the airport
    self
  end

  def launch (plane)
    #check weather
    fail 'Stormy weather' if weather_check == :stormy
    #fail if the plane isn't at this airport
    fail unless @planes.include?(plane)
    #remove the plane from the airport and return it
    @planes.delete(plane)
  end

  def planes
    @planes
  end

  def weather_check
    [:stormy,:sunny][[rand(10),1].min]
  end

end
