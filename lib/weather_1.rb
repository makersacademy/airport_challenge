require './lib/airport_1.rb'

module Weather
  def forecast 
    states = ["rainy", "stormy", "sunny", "foggy", "clear"]
    states[rand(5)]
  end 
end 
 