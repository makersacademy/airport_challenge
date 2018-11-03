require_relative 'plane'
require_relative 'weather'
class Airport
  attr_reader :hangar

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def landing(plane)
    fail 'Hangar is full' if full?
    @hangar << plane
  end

  def taking_off(plane)
    fail 'Hangar is empty' if @hangar.empty?
    @hangar.delete_at(@hangar.index(plane))
    plane
  end

  private
  def full?
    @hangar.count >= @capacity
  end

  def empty?
    @hangar.count.zero?
  end

end
