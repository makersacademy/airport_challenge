require './lib/weather'

class Airport < Weather

  attr_reader :plane, :hangar, :capacity
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    raise "The plane cannot land" if stormy? || full?
    @hangar << plane
  end

  def take_off
    raise "It is too stormy to fly" if stormy?
    departed_plane = @hangar.pop
    puts "#{departed_plane} has left the airport"
  end

  private

  def stormy?
    conditions
  end

  def full?
    @hangar.count >= @capacity
  end

end
