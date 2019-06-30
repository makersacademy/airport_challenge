require './lib/airport_challenge.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do

  it 'has an empty hangar initially' do
    expect(subject.hangar).to eq []
  end

  describe 'land_plane' do
    it 'lands a plane' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.hangar).to eq [plane]
    end
  end

  describe 'take_off' do
    it 'allows plane to take off from airport' do
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      subject.land_plane(plane)
      subject.take_off(weather)
      expect(subject.hangar).to eq []
    end

    it 'stops plane taking off when stormy weather' do
      plane = Plane.new
      weather = Weather.new
      allow(weather).to receive(:stormy?) { true }
      subject.land_plane(plane)
      subject.take_off(weather)
      expect(subject.hangar).to eq [plane]
    end
  end
end
