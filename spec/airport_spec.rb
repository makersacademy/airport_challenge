require_relative '../lib/airport.rb'

describe Airport do
  airport = Airport.new
  plane = Plane.new

  describe 'landing planes' do
    it { is_expected.to respond_to(:land_plane) }
    it 'allows planes to land when instructed' do

    end
    it 'stores planes in a hangar when they land' do

    end
    it 'prevents a plane from landing if the weather is stormy' do

    end
    it 'prevents a plane from landing if the hangar is full' do

    end
  end

  describe 'taking off planes' do
    it { is_expected.to respond_to(:take_off_plane) }
    it 'allows a plane to take-off when instructed' do

    end
    it 'confirms a plane is removed from the hanger after take-off' do

    end
    it 'prevents a plane from taking off if the weather is stormy' do

    end
  end
end
