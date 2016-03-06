require_relative 'plane'

class Airport

  attr_reader :airfield

  def initialize
    @airfield  = []
  end

  def land(plane)
    fail "The weather is too bad" if forecast == 'stormy'
    plane.land
    @airfield << plane
  end

  def confirm_landing(plane)
    airfield.include?(plane) ? true : false
  end

  def dispatch(plane)
    fail "This plane is not in the airfield" unless @airfield.include?(plane)
    fail "The weather is too bad" if forecast == 'stormy'
    @airfield.delete_if { |pl| pl == plane }
    plane.take_off
    plane
  end

  def confirm_dispatch(plane)
    airfield.include?(plane) ? false : true
  end

  def forecast
    weather_seed = { 'sunny' => 19, 'stormy' => 1 }
    weather = []
    weather_seed.each do |condition, weight|
      weight.times { weather << condition }
    end
    weather.sample
  end

end
