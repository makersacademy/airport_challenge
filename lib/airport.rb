class Airport
  def initialize(capacity = 100)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def contains?(plane)
    @planes.include?(plane)
  end

  def add_plane(plane)
    @planes << plane
  end

  def remove_plane(plane)
    @planes -= [plane]
  end

  def full?
    @planes.length >= @capacity
  end

  def change_capacity(capacity)
    check_capacity(capacity)
    @capacity = capacity
  end

  def check_capacity(capacity)
    int_check(capacity)
    capacity_below_usage_check(capacity)
  end

  def int_check(capacity)
    raise "Must be an integer" unless capacity.to_int == capacity
  end

  def capacity_below_usage_check(capacity)
    raise "Can't reduce capacity below current usage" if capacity < @planes.length
  end

  def stormy?
    @weather.check == 'stormy'
  end
end

class Plane
  attr_reader :airport

  def initialize(airport = nil)
    check_valid_airport_ignore_nil(airport)
    check_airport_full_ignore_nil(airport)
    add_plane_unless_nil(airport)
  end

  def land(airport)
    can_land?(airport)
    add_plane_unless_nil(airport)
    self
  end

  def take_off
    can_take_off?
    @airport.remove_plane(self)
    return_string = "#{self} has taken off from #{@airport}"
    @airport = nil
    return_string
  end

  def check_valid_airport_ignore_nil(airport)
    raise "Not a valid airport" if airport && !airport.is_a?(Airport)
  end

  def check_valid_airport(airport)
    raise "Not a valid airport" unless airport.is_a?(Airport)
  end

  def add_plane_unless_nil(airport)
    airport&.add_plane(self)
    @airport = airport
  end

  def can_take_off?
    raise "Can't take off when not in airport" if flying?

    raise "Can't take off when weather is stormy" if @airport.stormy?
  end

  def can_land?(airport)
    raise "Can't land when in an airport" unless flying?

    check_valid_airport(airport)
    check_airport_full_ignore_nil(airport)
    raise "Can't land when stormy" if airport.stormy?
  end

  def check_airport_full_ignore_nil(airport)
    raise "Airport full" if airport&.full?
  end

  def flying?
    @airport.nil?
  end
end

class Weather
  def initialize
    @possible_weather = generate_weather_possibilities
  end

  def check
    @possible_weather[rand(@possible_weather.length)]
  end

  def generate_weather_possibilities
    chance_sunny = 95
    chance_stormy = 5
    out_arr = []
    chance_sunny.times { out_arr << 'sunny' }
    chance_stormy.times { out_arr << 'stormy' }
    out_arr
  end
end
