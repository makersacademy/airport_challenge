
require './lib/plane.rb'
require './lib/Weather.rb'

class Airport

  def initialize
    @planes_on_the_ground = []
    @planes_in_the_air = []
    @current_weather = Weather.new

  end

  def current_weather
    if @current_weather.stormy? == true
      true
    else
      false
    end
  end

  def land plane
    raise "this plane has already landed" if @planes_on_the_ground.include?(plane)
    raise "plane cannot land due to stormy conditions" if current_weather == true
     @planes_on_the_ground << plane

  end

  def planes_landed
    @planes_on_the_ground
  end

  def takeoff plane
    raise "this plane has already taken off" unless @planes_on_the_ground.include?(plane)
    raise "plane cannot take off due to stormy weather" if current_weather == true
    @planes_in_the_air = @planes_on_the_ground.select {|p| p == plane }
    @planes_on_the_ground.delete_if {|p| p == plane}
    @planes_in_the_air
  end


end