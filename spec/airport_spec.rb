require './lib/airport.rb'
require './lib/weather.rb'

describe Airport do
describe '#land_plane' do
  it {is_expected.to respond_to :land_plane }
  it 'actively lands planes' do
  plane = Airplane.new
  subject.land_plane(plane)
  expect(subject.landed_planes).to include(plane)
  end
  it 'prints confirmation of landing' do
    plane = Airplane.new
    expect(subject.land_plane(plane)).to include("The plane has landed")
  end
end

describe '#takeoff' do
  it {is_expected.to respond_to :takeoff}
  it 'makes a plane take off from airport' do
    plane = Airplane.new
    subject.land_plane(plane)
    expect(subject.landed_planes).to include(plane)
    subject.takeoff
    expect(subject.landed_planes).to_not include(plane)
  end
  it 'prints confirmation of takeoff' do
    plane = Airplane.new
    subject.land_plane(plane)
    expect(subject.takeoff).to include("The plane has left")
  end
end
end
