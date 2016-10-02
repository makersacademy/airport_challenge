require 'airport'
require 'plane_file'

describe Airport do

  describe '#landed?()' do
    it 'checks if a plane has landed' do
      test_plane = Plane.new
      test_airport = Airport.new
      test_airport.accept_plane(test_plane)
      expect( test_airport.landed?(test_plane) ).to eq true
    end
  end

  describe '#accept_plane(plane_name)' do
    it 'allows a plane to land and adds it to list of planes at airport' do
      test_plane = Plane.new
      subject.accept_plane(test_plane)
      expect( subject.landed?(test_plane) ).to eq true
    end
  end
end
