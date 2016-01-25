require 'airport'
require 'plane'
require 'weather'

describe '#land' do
  let(:airport) {Airport.new}
  let(:weather) {Weather.new}
  let(:planes) {[]}
  before {20.times {planes << Plane.new}}
  before {allow(weather).to receive(:stormy?).and_return(false)}

  it 'expects all the planes to be in the airport' do
    planes.each {|plane| plane.land(airport, weather)}
    expect(airport.planes_in_airport).to eq(planes)
  end

  it 'expects not to be able to land a plane twice' do
    plane = planes.pop
    plane.land(airport, weather)
    message = "Plane has already landed!"
    expect {plane.land(airport, weather)}.to raise_error(message)
  end

  it 'expects that airports should not be able to land planes that have landed' do
    plane = planes.pop
    plane.land(airport, weather)
    message = "Plane has already landed!"
    expect {airport.land(plane, weather)}.to raise_error(message)
  end


end
