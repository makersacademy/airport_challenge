require "./lib/airport.rb"
class Plane

plane = Plane.new

attr_accessor :airport, :weather

def land(airport)
weather = [1, 2, 3, 4, 5].sample
  if weather == 1
  return "Weather is stormy - plane cannot land"
  else @airport = airport 
  end
end

def take_off
weather = [1, 2, 3, 4, 5].sample
  if weather == 1
  return "Weather is stormy - plane cannot take off"
  else @airport = nil
  end
end
end
