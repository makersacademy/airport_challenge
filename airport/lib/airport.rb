require_relative "plane"

class Airport

  # attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Airport is full" if full?
    @planes << plane

  end

  def take_off(plane)
    "#{plane} is no longer in the airport"
  end

  private

  def full?
    @planes.count >= 30
  end

end
