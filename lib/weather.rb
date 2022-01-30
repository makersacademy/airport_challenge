require_relative './airport.rb'

class Weather
  def initialize
    @flying_conditions = flying_conditions
  end

  def flying_conditions
    counter = Random.rand(1..6)
    flying_conditions = (counter == 6)
    # when true, weather is stormy
    # when false, weather is clear
  end
end
