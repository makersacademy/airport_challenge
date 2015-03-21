require_relative 'control_tower'

class Airport
  attr_reader :control_tower, :planes

  DEFAULT_CAPACITY = 30
  def initialize(options = {})
    @control_tower = ControlTower.new
    @planes = []
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def park plane
    fail 'Airport is Full' if full?
    planes << plane
  end

  def unpark plane
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
