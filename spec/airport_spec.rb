require 'airport'

describe Airport do
  it 'creating a new instance of airport' do
    airport = Airport.new
  expect(airport).to be_a Airport
  end

  it 'so an airport can be an airport method' do
    airport = Airport.new
  expect(airport).to respond_to :airport?
  end

  it 'making sure airport exists' do
   expect(Airport.new.airport?).to be true
  end

  it 'landing the plane at the airport' do
    airport = Airport.new
  expect(airport).to respond_to(:land_plane).with(1).argument
  end

  it 'taking off the plane at the airport' do
    airport = Airport.new
  expect(airport).to respond_to(:take_off_plane).with(1).argument
  end

  it 'taking off the plane at the airport' do
  expect(subject.take_off_plane Plane.new).to eq nil
  end

  it 'prevent landing when airport is full' do
    200.times { subject.land_plane Plane.new }
  expect(subject.land_plane Plane.new).to raise_error "Airport is full"
  end

end
