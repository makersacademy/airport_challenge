require_relative './plane.rb'

class Airport

  DEFAULT_CAPACITY = 2

  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def landing(plane)
    fail 'No space available' if full?
    return unless giving_permition_for_landing(plane) == true

    plane.current_position = to_s
    @hangar << plane
  end

  def take_off(plane)
    return unless giving_permition_for_take_off(plane) == true

    @hangar.delete(plane)
  end

  def giving_permition_for_landing(plane)
    return unless plane.asking_for_permission? == true

    true
  end

  def giving_permition_for_take_off(plane)
    return unless plane.asking_for_permission? == true

    true
  end

  private

  def full?
    @hangar.size >= @capacity
  end

end
