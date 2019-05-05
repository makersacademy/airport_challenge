require 'airport'
require 'plane'
require 'weather'

describe Airport do

describe '#land'
plane = Plane.new

  it 'should instruct plane to land at an airport' do
  subject.land(plane)
  expect(subject.planes).to include(plane)
end

describe '#takeoff'

  it 'should instruct plane to takeoff from airport' do
    subject.land(plane)
    subject.takeoff
    expect(subject.planes).not_to include(plane)
  end

  it 'should display error message if weather is stormy' do
    weather = Weather.new
    weather.is_stormy?
    expect { true }.to raise_error("Stormy weather conditions")
  end

end
