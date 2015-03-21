require_relative 'control_tower'

class Airport
  attr_reader :control_tower, :planes, :available_room

  DEFAULT_CAPACITY = 30
  def initialize(options = {})
    @control_tower = ControlTower.new
    @planes = []
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @available_room = @capacity
  end

  def park plane
    fail 'Plane is in the airport' if planes.include?(plane)
    fail 'Airport is Full' if full?
    @available_room -= 1
    planes << plane
  end

  def unpark plane
    fail 'Plane is not in the airport' unless planes.include?(plane)
    @available_room += 1
    planes.delete(plane)
  end

  private

  def planes_count
    planes.length
  end

  def full?
    planes_count >= @capacity
  end
end
