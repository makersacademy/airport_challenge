class Airport
  AIRPORT_CAPACITY = 3

  def initialize(name, capacity = AIRPORT_CAPACITY)
    @hangar = []
    @name = name
    @capacity = capacity
  end

  def randomize_weather
    weather = ['sunny', 'sunny', 'sunny', 'sunny', 'stormy']
    randomize = rand(0..4)
    weather[randomize]
  end

  def land(plane)
    raise "You can't land. #{@name}'s hangar is full." unless @hangar.length < @capacity
    raise "You can't land yet. It's too stormy." if randomize_weather == 'stormy'
    @hangar << plane if randomize_weather == 'sunny'
  end

  def depart(plane)
    @hangar.delete(plane)
    "Plane #{plane} has left #{@name}"
  end
end
