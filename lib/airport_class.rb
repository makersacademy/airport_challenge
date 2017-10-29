require_relative 'plane_class'

class Airport

  attr_reader :hangars
  attr_accessor :weather

  def initialize(capacity = 10)
    @capacity = capacity
    @hangars = []
    @weather = ['sunny', 'sunny', 'sunny', 'stormy']
  end

  def full?
    @hangars.count == @capacity ? true : false
  end

  def land(plane)
    raise "The Airport is full, the plane can't land" if full? == true
    raise "The weather is stormy, the plane can't land." if @weather.sample == 'stormy'
    @hangars << plane
  end

  def take_off(plane_hangar)
    raise "The weater is stormy, the plane can't depart." if @weather.sample == 'stormy'
    @hangars.delete_at(plane_hangar)
  end

end
