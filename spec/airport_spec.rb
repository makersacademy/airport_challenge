require 'airport'
require 'plane'

describe Airport do
  let(:airport) {Airport.new(capacity: 200)}
  let(:plane) {Plane.new}

  context 'take off and landing' do

    it 'plane is able to land' do
      expect(airport).to be_plane_landing
    end

    it 'plane is able to take off' do
      expect(airport).to be_take_off_planes
  end
end

context 'systems controller' do
  it 'a plane is not able to land if airport is full' do
    full_airport, empty_airport = Airport.new, Airport.new
    expect(airport).not_to be_full
  end
  end
end
