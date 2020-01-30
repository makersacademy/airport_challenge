require "./lib/plane.rb"
require "./lib/airport.rb"
require "./lib/weather_report.rb"
weather_report = Weather_Report.new
plane = Plane.new
airport = Airport.new(weather_report, Airport::DEFAULT_CAPACITY)
p "ooh a shiny new airport"
p "what's the weather like today?"

if weather_report.stormy? == true
  p "stormy, sorry, no flying today"
else
  p "a plane is landing..."
  airport.land(plane)
  p "plane landed woohoo *applause*"
  p "now it will take off"
  airport.take_off(plane)
  p "plane took off, bye!"
  p "sunny"
end
