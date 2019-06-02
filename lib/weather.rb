# weather = stormy then no take off && landing
# random number generator to set weather 
# stub to override random weather
class Weather
  
  def stormy?
    rand(1..20) > 5 
  end
end
