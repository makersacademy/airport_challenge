require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:plane) { double :plane, flying: true, land: false }
  let(:plane_in_airport) { double :plane, flying: false, take_off: true }
  let(:plane_in_stormy_weather) { double :plane, flying: false }
  let(:stormy_weather) { double :weather, condition: "stormy" }
  let(:clear_weather) { double :weather, condition: "clear" }

  describe '#lands_plane' do
    it 'shows plane in airport once it has landed' do
      subject.lands_plane(plane)
      expect(subject.planes.last).to eq plane
    end
  end

  describe '#takes_off_plane' do
    it 'shows plane no longer in airport once it has taken off' do
      subject.planes << plane_in_airport
      subject.takes_off_plane(plane_in_airport, clear_weather)
      expect(subject.planes.include?(plane_in_airport)).to eq false
    end

    it 'shows plane is still in the airport because weather is stormy' do
      subject.planes << plane_in_stormy_weather
      allow(stormy_weather).to receive(:condition) { "stormy" }
      expect { subject.takes_off_plane(plane_in_stormy_weather, stormy_weather) }.to raise_error("Weather is stormy. Plane cannot take off.")
      expect(subject.planes.include?(plane_in_stormy_weather)).to eq true
    end
  end
end
