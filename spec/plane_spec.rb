# frozen_string_literal: true

require_relative '../lib/plane'

describe Plane do
  # possible to create a new plane
  it 'should create a Plane instant with Plane.new when given correct number of initial arguments (1..2)' do
    new_plane = Plane.new('TEST')
    expect(new_plane).to be_an_instance_of(Plane)
  end

  describe '#check_location' do
    # check location should give correct result for plane taken off
    it "should return the correct location for a plane that has taken off ('IN TRANSIT/AIR')" do
      allow_any_instance_of(Weather).to receive(:weather_now).and_return('clear')
      new_airport = Airport.new('AIRPORT')
      new_plane = Plane.new('PLANE')
      new_plane.plane_attributes[:airport_id] = new_airport.airport_attributes[:airport_id]
      new_airport.airport_attributes[:planes] << new_plane
      new_airport.take_off(new_plane)
      expect(new_plane.check_location).to eq('IN TRANSIT/AIR')
    end

    # check location should give correct location for plane when it lands
    it 'should return the correct location for a plane that has landed (same as airport_id of airport)' do
      allow_any_instance_of(Weather).to receive(:weather_now).and_return('clear')
      new_airport = Airport.new('AIRPORT')
      new_plane = Plane.new('PLANE')
      new_airport.land(new_plane)
      expect(new_plane.check_location).to eq(new_airport.airport_attributes[:airport_id])
    end
  end
end
