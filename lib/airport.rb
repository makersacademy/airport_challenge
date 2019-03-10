class Airport
  require "weather"

  DEFAULT_CAPACITY = 10
  attr_reader :capacity
  attr_reader :fleet

  def initialize
    @fleet = []
    @capacity = DEFAULT_CAPACITY
  end

  def confirm_plane_absence(plane)
    plane.location != self
  end

  def full?
    @fleet.count >= @capacity
  end

  def add_plane(plane)
    capacity_err = StandardError.new("Sorry, this airport is already full")
    full? ? raise(capacity_err) : @fleet << plane
  end

  def remove_plane(plane)
    @fleet.delete(plane)
  end

  def update_capacity(new_capacity)
    @capacity = new_capacity
    puts "Capacity Updated"
  end

  def local_weather
    Weather.new.current_weather
  end
end
