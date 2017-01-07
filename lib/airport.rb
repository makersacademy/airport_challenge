require 'plane'

class Airport
  attr_accessor :weather, :capacity, :planes
  def initialize(args)
    @weather = args.fetch(:weather, forecast)
    @capacity = args.fetch(:capacity, 20)
    @planes = []
  end
  def ask_to_land(plane)
    raise "Unable to land due to airport being full" if is_full?
    raise "Unable to land due to weather being stormy" if is_stormy?
    @planes << plane
  end
  def ask_to_take_off(plane)
    raise "Unable to take off due to weather being stormy" if is_stormy?
    @planes.delete(plane)
  end
  def has_landed?(plane)
    @planes.include?(plane)
  end
  def has_taken_off?(plane)
    @planes.include?(plane) == false
  end

  private

  def forecast
    rand < 0.1 ? 'stormy' : 'fine'
  end
  def is_stormy?
    @weather == 'stormy'
  end
  def is_full?
    @planes.size == @capacity
  end
end
