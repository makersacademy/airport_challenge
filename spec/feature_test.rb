require_relative '../lib/airport.rb'
require_relative '../lib/passenger.rb'
require_relative '../lib/plane.rb'
require_relative '../lib/weather.rb'

people = [Passenger.new,Passenger.new,Passenger.new]
airport = Airport.new
plane = Plane.new
mob = []
100.times{ mob.concat([Passenger.new])}

p airport.seats
p airport.load(people)
p airport.load
p airport.unload
p airport.seats
p airport.load(people)
p airport.seats

p airport.unload
p airport.seats

p airport.load(mob)
p airport.seats.size
begin
p airport.load(mob)
rescue
  puts "Confirm raised error due to full capacity!"
end
p airport.seats.size
p airport.unload
p airport.seats
p airport.load(people)

p plane.seats
moving = airport.unload
p plane.load(moving)
p airport.seats
p plane.seats
begin
p plane.land
rescue
  puts "Confirm raised error due to plane already landed!"
end
begin
p plane.take_off
p plane.land(airport)
p plane.take_off
begin
p plane.unload
rescue
  puts "Confirm you can't chuck passengers our of airbourne plane!"
end
p plane.seats
p plane.land(airport)
p plane.unload
p plane.seats
p plane.load(people)
p plane.take_off
p airport.load(mob)
begin
p plane.land(airport)
rescue
  puts "Confirm plane can't land because of full airport!"
end
p airport.unload
p plane.land(airport)

p plane.take_off
rescue
  puts "Confirm weather stormy. Can't take off."
end



