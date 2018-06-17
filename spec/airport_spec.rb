require_relative '../lib/airport.rb'

describe Airport do
  airport = Airport.new
  plane = Plane.new

  describe 'capacity' do
    it { expect(airport.hangar_capacity).to eq 10 }
    it 'allows user to change default capacity on instantiation' do
      large_airport = Airport.new(25)
      expect(large_airport.hangar_capacity).to eq 25
    end
  end

  describe 'landing' do
    it { is_expected.to respond_to(:land_plane) }
    it 'allows a plane to land when instructed' do
      expect(airport.land_plane(plane)).to eq 'Plane has successfully landed'
    end
    it 'stores a plane in a hangar when it lands' do
      airport.land_plane(plane)
      expect(airport.hangar).to include plane
    end
    it 'prevents a plane from landing if the weather is stormy' do

    end
    it 'prevents a plane from landing if the hangar is full' do

    end
  end

  describe 'taking off' do
    it { is_expected.to respond_to(:take_off_plane) }
    it 'allows a plane to take-off when instructed' do
      expect(airport.take_off_plane).to eq 'Plane has successfully taken off'
    end
    it 'removes a landed plane from the hangar when it takes off' do
      
    end
    it 'confirms a plane is removed from the hanger after take-off' do

    end
    it 'prevents a plane from taking off if the weather is stormy' do

    end
  end
end
