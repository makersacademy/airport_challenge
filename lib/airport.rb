require_relative 'weather'
require_relative 'plane'

class Airport
  attr_reader :capacity, :run_way
  DEFAULT_CAPACITY = 25

  def initialize(capacity = DEFAULT_CAPACITY)
    @run_way = []
    @capacity = capacity
  end

  def permission_to_land?(plane)
    Weather.sunny? && not_full? && plane.flying?
  end

  def permission_to_leave?(plane)
    Weather.sunny? && present?(plane)
  end

  def land_plane(plane)
    run_way_check(plane) {run_way << plane}
  end

  def plane_take_off(plane)
    run_way_check(plane) do
      run_way.delete(plane)
      plane
    end
  end

  def insult(plane)
    "You been on the wacky-backy, You're in #{plane.location}"
  end

  private
  def not_full?
    run_way.size < capacity
  end

  def present?(plane)
    plane.location == self
  end

  def run_way_check(plane, &block)
    return "You're still on the ground moron" unless plane.flying?
    return insult(plane) unless present?(plane)
    yield
  end

end
