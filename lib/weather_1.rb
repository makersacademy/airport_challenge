require './lib/airport.rb'

module Weather
  def forecast 
    states = ["rainy", "stormy", "sunny", "foggy", "clear"]
    states[rand(5)]
  end 
end 
 