require 'air_traffic_control.rb'

describe 'ATC' do
  # before(:each)
  #   airport_with_spaces = double(Airport.new)
  #   allow(airport_with_spaces).to receive(:capcity_status) { "there are spaces to land in" }
  #   stormy_weather = double(Weather.new)
  #   allow(stormy_weather).to receive(:status) { "stormy" }
  # end

  describe '#land_plane' do
    it 'fails when stormy' do
      airport_with_spaces = Airport.new
      stormy_weather = double(Weather.new)
      allow(stormy_weather).to receive(:status) { "stormy" }
      atc = ATC.new(stormy_weather, airport_with_spaces)
      plane = Plane.new
      expect { atc.land_plane(plane) }.to raise_error "Can't land - too stormy"
    end

    it 'fails when airport is full' do
      full_airport = double(Airport.new)
      allow(full_airport).to receive(:capacity_status) { "full" }
      sunny_weather = double(Weather.new)
      allow(sunny_weather).to receive(:status) { "sunny" }
      atc = ATC.new(sunny_weather, full_airport)
      plane = Plane.new
      expect { atc.land_plane(plane) }.to raise_error "Can't land - airport full"
    end

    it 'lands a plane when sunny' do
      sunny_weather = double(Weather.new)
      allow(sunny_weather).to receive(:status) { "sunny" }
      airport_with_spaces = Airport.new
      atc = ATC.new(sunny_weather, airport_with_spaces)
      expect(atc.land_plane()).to eq "Plane landed"
      # later this could become more specific eg 'Oceanic flight 815 has landed'
    end
  end

  describe '#takeoff_plane' do
    it 'fails when stormy' do
      airport_with_spaces = Airport.new
      stormy_weather = double(Weather.new)
      allow(stormy_weather).to receive(:status) { "stormy" }
      atc = ATC.new(stormy_weather, airport_with_spaces)
      plane = Plane.new
      expect { atc.takeoff_plane(plane) }.to raise_error "Can't takeoff - too stormy"
    end

    it 'takesoff plane when sunny' do
      airport_with_spaces = Airport.new
      sunny_weather = double(Weather.new)
      allow(sunny_weather).to receive(:status) { "sunny" }
      atc = ATC.new(sunny_weather, airport_with_spaces)
      plane = Plane.new
      expect(atc.takeoff_plane(plane)).to eq "Plane tookoff" 
      # later this could become 'Flight FR23 departed' or similar
    end
  end
end
