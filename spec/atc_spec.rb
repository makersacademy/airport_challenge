require 'air_traffic_control.rb'

describe 'ATC' do

  describe '#land_plane' do
    it 'fails when stormy' do
      stormy_weather = double(Weather.new)
      allow(stormy_weather).to receive(:status) { "stormy" }
      atc = ATC.new(stormy_weather)
      plane = Plane.new
      expect { atc.land_plane(plane) }.to raise_error "Can't land - too stormy"
    end

    it 'fails when airport is full' do
      full_airport = double(Airport.new)
      allow(full_airport).to receive(:capcity_status) { "full" }
      sunny_weather = double(Weather.new)
      allow(sunny_weather).to receive(:status) { "sunny" }
      atc = ATC.new(sunny_weather)
      plane = Plane.new
      expect { atc.land_plane(plane) }.to raise_error "Can't land - airport full"
    end

    it 'lands a plane when sunny' do
      sunny_weather = double(Weather.new)
      allow(sunny_weather).to receive(:status) { "sunny" }
      atc = ATC.new(sunny_weather)
      plane = Plane.new
      expect(atc.land_plane(plane)).to eq "Plane landed"
      # later this could become more specific eg 'Oceanic flight 815 has landed'
    end
  end

  describe '#takeoff_plane' do
    it 'fails when stormy' do
      stormy_weather = double(Weather.new)
      allow(stormy_weather).to receive(:status) { "stormy" }
      atc = ATC.new(stormy_weather)
      plane = Plane.new
      expect { atc.takeoff_plane(plane) }.to raise_error "Can't takeoff - too stormy"
    end

    it 'takesoff plane when sunny' do
      sunny_weather = double(Weather.new)
      allow(sunny_weather).to receive(:status) { "sunny" }
      atc = ATC.new(sunny_weather)
      plane = Plane.new
      expect(atc.takeoff_plane(plane)).to eq "Plane tookoff" 
      # later this could become 'Flight FR23 departed' or similar
    end
  end
end
