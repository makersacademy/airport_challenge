require 'airport'
require 'plane'
require 'weather'

describe '#takeoff' do
  let(:airport) {Airport.new}
  let(:weather) {Weather.new}
  let(:planes) {[]}
  before {20.times {planes << Plane.new}}
  before {allow(weather).to receive(:stormy?).and_return(false)}

  it 'expects all the planes to leave the airport' do
    planes.each {|plane| plane.land(airport, weather)}
    planes.each {|plane| plane.takeoff(airport, weather)}
    expect(airport.planes_in_airport).to eq([])
  end

  it 'expects not to be able to takeoff a plane twice' do
    plane = planes.pop
    plane.land(airport, weather)
    plane.takeoff(airport, weather)
    message = "Plane cannot takeoff if it is not in an airport!"
    expect {plane.takeoff(airport, weather)}.to raise_error(message)
  end

  it 'expects that airports should not be able to takeoff planes that have already taken off' do
    plane = planes.pop
    plane.land(airport, weather)
    plane.takeoff(airport, weather)
    message = "Plane cannot takeoff if it is not in an airport!"
    expect{airport.takeoff(plane, weather)}.to raise_error(message)
  end

end
