class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :capacity
  attr_reader :weather
  attr_reader :fleet

  def initialize
    weather_options = ["sunny", "stormy"]
    @weather = weather_options[rand(2)]
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
    @fleet << plane
  end

  def remove_plane(plane)
    @fleet.delete(plane)
  end

  def update_capacity(new_capacity)
    @capacity = new_capacity
    puts "Capacity Updated"
  end
end
