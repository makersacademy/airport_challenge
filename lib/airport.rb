require_relative 'plane'

class Airport
  attr_accessor :landed_planes
  attr_accessor :weather
  attr_accessor :airport_capacity

  # sets airport capacity to 20 as default
  # creates @weather set to sunny
  # creates empty array for landed planes
  def initialize(default_capacity = 20)
    @landed_planes = []
    @weather = 'sunny'
    @airport_capacity = default_capacity
  end

  # changes airport capacity to integer argument
  def change_capacity(num)
    @airport_capacity = num
  end

  # adds plane to landed_planes array
  # gives an error if plane tries to land when airport is full, weather is stormy or plane is already at airport
  def land(plane)
    raise 'Weather not suitable for landing' if weather? == false
    raise 'Airport full, no space to land' if full?
    raise 'Plane has already landed at airport' if landed_planes.include?(plane)

    @landed_planes.append(plane)
    puts "#{plane} has landed"
  end

  # removes plane from landed_planes array
  # gives error if weather is stormy or plane is not at the airport
  def take_off(plane)
    raise 'Weather not suitable for flight' unless weather?
    raise 'Plane is not currently at this airport' unless landed_planes.include? plane

    @landed_planes.delete(plane)
    puts "#{plane} has departed"
  end

  private

  # checks landed_planes array for plane
  def in_airport(plane)
    if @landed_planes.include? plane
      true
    else
      false
    end
  end

  # checks if landed_planes array has hit limit of airport_capacity
  def full?
    landed_planes.count >= airport_capacity
  end

  # sets @weather to one of four possibilites randomly
  # returns false if weather is stormy, true otherwise
  def weather?
    possible_weather = %w[sunny cloudy raining stormy]
    @weather = possible_weather[rand(1..4)]
    @weather != 'stormy'
  end
end
