class Airport
  attr_accessor :plane_hangar
  attr_accessor :weather  #if weather is 1, it is too stormy to fly


  def initialize(weather = 10, capacity = 15)
    @weather = weather
    @plane_hangar = []
    @capacity = capacity
    @prng = Random.new
  end

  def randomise_weather
    @weather = @prng.rand(10)
  end

  def land(plane)
    weather? ? @plane_hangar << plane : raise('Cannot land in bad weather')
    return true
  end

  def takeoff(plane)
    weather? ? @plane_hangar.select {|x| x == plane } : raise('Cannot take off in bad weather')
  end

  def weather?
    true if @weather > 1
  end
end
