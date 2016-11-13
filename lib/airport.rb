require_relative 'weather.rb'
require_relative 'plane.rb'


class Airport

attr_accessor :plane, :weather, :capacity

def initialize(weather = "calm", capacity = 20)
@plane = []
@weather = weather
@capacity = capacity
end

def landing_request(granted = true)
if weather == "stormy"
  granted = false
puts "You do not have permission to land"
elsif @plane.count == capacity
  granted = false
puts "You do not have permission to land"
else
  granted = true
puts "You have permission to land"
end
granted
end

def landed(confirmed = true)
  if confirmed == true
  @plane << Plane.new
  else
  @plane
end
end

def take_off_request(granted = true)
if @plane == []
  granted = false
  "There are no planes in the airport"
elsif weather == "stormy"
  granted = false
else
  granted = true
  puts "You have permission to take off"
end
take_off_plane = @plane.pop
granted
end

def taken_off(confirmed = true)
  confirmed
end


def weather_report
 weather = Weather.new
 @weather = weather.report
end

def weather_report_stormy
  @weather = "stormy"
end

def weather_report_calm
  @weather = "calm"
end

end
