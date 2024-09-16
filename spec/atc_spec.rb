require 'air_traffic_control.rb'

describe ATC do

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
      expect { atc.takeoff_plane }.to raise_error "Can't takeoff - too stormy"
    end

    it 'fails if no planes are at the airport' do
      airport = Airport.new
      sunny_weather = double(Weather.new)
      allow(sunny_weather).to receive(:status) { "sunny" }
      atc = ATC.new(sunny_weather, airport)
      expect { atc.takeoff_plane }.to raise_error "Can't perform takeoff - no planes at the airport"
    end

    it 'performs and confirms plane takefoff when sunny' do
      airport_with_spaces = Airport.new
      sunny_weather = double(Weather.new)
      allow(sunny_weather).to receive(:status) { "sunny" }
      atc = ATC.new(sunny_weather, airport_with_spaces)
      plane1 = Plane.new
      plane2 = Plane.new
      atc.land_plane(plane1)
      atc.land_plane(plane2)
      expect(atc.takeoff_plane).to eq "Confirmation: #{plane2} tookoff" # include str interp for plane instance
    end
  end
end
