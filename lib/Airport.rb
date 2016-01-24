
require './lib/plane.rb'
require './lib/Weather.rb'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize (capacity=DEFAULT_CAPACITY)
    @planes_on_the_ground = []
    @planes_in_the_air = []
    @current_weather = Weather.new
    @capacity = capacity
  end

  def current_weather
    if @current_weather.stormy? == true
      true
    else
      false
    end
  end

  def capacity_hit
    if @capacity == 0
      true
    else
      false
    end
  end

  def land plane
    raise "this plane has already landed" if @planes_on_the_ground.include?(plane)
    raise "plane cannot land due to stormy conditions" if current_weather == true
    raise "plane cannot land as airport is full" if capacity_hit == true
     @capacity -= 1
     @planes_on_the_ground << plane
  end

  def planes_landed
    @planes_on_the_ground
  end

  def takeoff plane
    raise "this plane has already taken off" unless @planes_on_the_ground.include?(plane)
    raise "plane cannot take off due to stormy weather" if current_weather == true
    @capacity += 1
    @planes_in_the_air = @planes_on_the_ground.select {|p| p == plane }
    @planes_on_the_ground.delete_if {|p| p == plane}
    @planes_in_the_air
  end




end