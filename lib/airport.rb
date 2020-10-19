class Airport
  attr_reader :storage, :capacity, :weather
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @storage = []
    @capacity = capacity
    weathers = ["sunny", "stormy", "cloudy", "rain"]
    @weather = weathers[rand(4)-1]
  end
  def land(plane)
    raise("#{plane} can't land, it is stormy") if self.weather == "stormy"
    @storage.length < @capacity ? @storage << plane : raise("#{plane} can't land at #{self} as the airport is full!")
    "#{plane} landed at #{self}"
  end
  def takeoff(plane)
    raise("#{plane} can't take off, it is stormy") if self.weather == "stormy"
    here = @storage.select {|x| plane}
    raise("#{plane} can't take off, it isn't at #{self}") if here.empty?
    @storage.select! {|x| !plane}
    "#{plane} tookoff from #{self}"
  end
  def at_airport?(plane)
    here = @storage.select {|x| plane}
    here.empty? ? "#{plane} isn't at #{self}" : "#{plane} is at #{self}"
  end
end
