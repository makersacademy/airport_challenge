require './lib/airport'
require './lib/plane'

describe Airport do
  # let(:plane) {double :plane }
  let(:weather_good) { double :weather, :forecast => :sunny }
  let(:weather_bad) { double :weather, :forecast => :stormy }
  let(:plane) { Plane.new }

  context '#accept_plane' do
    it 'allows a Plane to land' do
      expect(subject.accept_plane(plane)).to eq plane
    end
  end

  context '#release_plane' do
    it 'should release plane if airport open' do
      subject.accept_plane(plane)
      subject.get_forecast(weather_good)
      expect(subject.release_plane).to eq true
    end

    it 'should raise error if weather conditions close airport' do
      subject.accept_plane(plane)
      subject.get_forecast(weather_bad)
      expect { subject.release_plane }.to raise_error('Due to weather conditions take off is not authorized')
    end
  end

end
