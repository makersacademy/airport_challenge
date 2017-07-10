require 'airport'
require 'plane'

describe Airport do

  describe 'messages that are handled' do

    it { is_expected.to respond_to(:land).with(1).argument } # message from ATC

    it { is_expected.to respond_to(:take_off).with(1).argument } # message from ATC

  end

  describe 'airport behaviour' do

    it 'lands a plane under the right circumstances' do
      flying_plane = Plane.new landed=false
      subject.land(flying_plane)

      nice_weather = double(:weather)
      allow(nice_weather).to receive(:stormy?).and_return(false)
      subject.weather = nice_weather

      subject.land(flying_plane)
      expect(flying_plane).to be_landed
    end
  end
end
