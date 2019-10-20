class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Cannot land due to stormy weather" if stormy?

    raise "Cannot land as airport full" if @planes.length == 10

    # raise "Plane already landed" if @planes.include?(plane)

    @planes << plane
  end

  def take_off(plane)
    raise "Cannot take off due to stormy weather" if stormy?

    # raise "Plane not in airport" if @planes.include?(plane) == false
    @planes.delete(plane)
    puts "#{plane} no longer in airport"
  end

  def stormy?
    Weather.new.stormy?
  end
end
