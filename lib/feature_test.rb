require './lib/plane'
plane = Plane.new
plane.landed?

require './lib/airport'
require './lib/plane'
airport = Airport.new
plane = Plane.new
airport.land(plane)
airport.take_off


require './lib/weather'
def weather
weather = []
weather_select = Random.new
weather_select = weather_select.rand(2)
if weather_select == 0
  weather << 'stormy'
else
  weather << 'sunny'
end
end

if weather.include? 'stormy'

end



let (:plane) { double :plane}
it 'does not allow take-off in storms' do
  plane = double :plane
  allow(plane).to receive(:stormy).and_return(true)
  subject.land(plane)
  expect {subject.take_off}.to raise_error 'No take-off when weather is stormy'


require './lib/airport'
require './lib/plane'
airport = Airport.new
plane = Plane.new
airport.land(plane)
