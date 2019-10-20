# require 'plane'

class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane_collection = []
    @capacity = capacity
    @weather = ["stormy", "sunny", "sunny", "sunny"].sample
  end

  def land(plane)
    raise "Caution! It's stormy!" if stormy?
    raise "Caution! Airport is full!" if full?
    raise "The same plane already landed" if @plane_collection.include?(plane)

    @plane_collection.push(plane)
    @plane_collection
    # plane.switch_status ? cannot do...
  end

  def departure(plane)
    raise "Caution! It's stormy!" if stormy?
    raise "The plane is not landed, so can't take off" unless @plane_collection.include?(plane)

    @plane_collection.delete(plane)
    @plane_collection
  end

  private
  def stormy?
    @weather == "stormy" ? true : false
  end 

  def full?
    @plane_collection.count >= @capacity ? true : false
  end
end
