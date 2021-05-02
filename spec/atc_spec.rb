require 'air_traffic_control.rb'

describe 'ATC' do

  describe '#land_plane' do
    it 'fails when stormy' do
      stormy_weather = Weather.new("stormy")
      atc = ATC.new(stormy_weather)
      plane = Plane.new
      expect { atc.land_plane(plane) }.to raise_error "Can't land - too stormy"
    end

    it 'lands a plane when sunny' do
      sunny_weather = Weather.new("sunny")
      atc = ATC.new(sunny_weather)
      plane = Plane.new
      expect(atc.land_plane(plane)).to eq "Plane landed"
      # later this could become more specific eg 'Oceanic flight 815 has landed'
    end
  end

  describe '#takeoff_plane' do
    it 'fails when stormy' do
      stormy_weather = Weather.new("stormy")
      atc = ATC.new(stormy_weather)
      plane = Plane.new
      expect { atc.takeoff_plane(plane) }.to raise_error "Can't takeoff - too stormy"
    end

    it 'takesoff plane when sunny' do
      sunny_weather = Weather.new("sunny")
      atc = ATC.new(sunny_weather)
      plane = Plane.new
      expect(atc.takeoff_plane(plane)).to eq "Plane tookoff" 
      # later this could become 'Flight FR23 departed' or similar
    end
  end
end
