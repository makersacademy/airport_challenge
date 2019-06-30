require './lib/airport_challenge.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do

  it 'has an empty hangar initially' do
    expect(subject.hangar).to eq []
  end

  describe 'land_plane' do
    it 'lands a plane in good weather' do
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      subject.land_plane(plane, weather)
      expect(subject.hangar).to eq [plane]
    end

    it 'stops plane landing when stormy weather' do
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?) { true }
      subject.land_plane(plane, weather)
      expect(subject.hangar).to eq []
    end

    it 'stops plane landing when airport full' do
      plane_one = Plane.new
      plane_two = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      subject.land_plane(plane_one, weather)
      subject.land_plane(plane_two, weather)
      expect(subject.hangar).to eq [plane_one]
    end
  end

  describe 'take_off' do
    it 'allows plane to take off from airport in good weather' do
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      subject.land_plane(plane, weather)
      subject.take_off(weather)
      expect(subject.hangar).to eq []
    end

    it 'stops plane taking off when stormy weather' do
      plane = Plane.new
      bad_weather = Weather.new
      good_weather = Weather.new
      allow(bad_weather).to receive(:stormy?) { true }
      allow(good_weather).to receive(:stormy?) { false }
      subject.land_plane(plane, good_weather)
      subject.take_off(bad_weather)
      expect(subject.hangar).to eq [plane]
    end
  end
end
