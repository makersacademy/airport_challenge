class Airport
  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Cannot land plane: airport is full" if full?
    raise "Cannot land plane: weather is stormy" if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise "Cannot take off plane: weather is stormy" if stormy?
  end


private

  def full?
    @planes.length >= @capacity
  end

  def stormy? #use low coupling with airport class and split to another class: weather reporter
    WeatherReporter.new.stormy?
  end
end
