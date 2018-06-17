require_relative '../lib/airport.rb'

describe Airport do

  describe 'capacity' do
    it { expect(Airport.new.hangar_capacity).to eq 10 }
    it 'allows user to change default capacity on instantiation' do
      large_airport = Airport.new(25)
      expect(large_airport.hangar_capacity).to eq 25
    end
  end

  describe 'landing' do
    it { is_expected.to respond_to(:land_plane) }
    it { is_expected.to respond_to(:hangar_full?) }
    it 'allows a plane to land when instructed' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land_plane(plane)).to eq 'Plane has successfully landed'
    end
    it 'stores a plane in a hangar when it lands' do
      airport = Airport.new
      plane = Plane.new
      airport.land_plane(plane)
      expect(airport.hangar).to include plane
    end
    it 'prevents a plane from landing if the weather is stormy' do
      airport = Airport.new
      plane = Plane.new
      allow(airport.weather).to receive(:condition) { 'Stormy' }
      expect { airport.land_plane(plane) }.to raise_error('It is too stormy to land!')
    end

    it 'prevents a plane from landing if the hangar is full' do
      airport = Airport.new
      expect { (airport.hangar_capacity + 1).times { airport.land_plane(Plane.new) } }.to raise_error('The hangar is full!')
    end
  end

  describe 'taking off' do
    it { is_expected.to respond_to(:take_off_plane) }
    it 'allows a plane to take-off when instructed' do
      airport = Airport.new
      expect(airport.take_off_plane).to eq 'Plane has successfully taken off'
    end
    it 'removes a landed plane from the hangar when it takes off' do

    end
    it 'confirms a plane is removed from the hanger after take-off' do

    end
    it 'prevents a plane from taking off if the weather is stormy' do
      airport = Airport.new
      allow(airport.weather).to receive(:condition) { 'Stormy' }
      expect { airport.take_off_plane }.to raise_error('It is too stormy to take-off!')
    end
  end
end
