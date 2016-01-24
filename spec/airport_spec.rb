require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let (:plane) {double :plane}
  let (:weather) {double :weather}
  subject(:airport) {described_class.new}

  it {is_expected.to respond_to(:land_plane)}
  describe '#land_plane' do
    it 'lands planes' do
      allow(airport).to receive(:check_weather) {false}
      expect{airport.land_plane(plane)}.to change{subject.planes.length}.by(1)
    end

    it 'does not land planes when the weather is stormy' do
      allow(airport).to receive(:check_weather) {true}
      expect{airport.land_plane(plane)}.to raise_error 'Permission denied, the weather is too dangerous.'
    end
  end

  it {is_expected.to respond_to(:clear_plane_for_take_off).with(1).argument}
  describe '#clear_plane_for_take_off' do
    it 'clears planes to take off' do
      allow(airport).to receive(:check_weather) {false}
      allow(plane).to receive(:cleared)
      airport.land_plane(plane)
      expect{airport.clear_plane_for_take_off(plane)}.to change{subject.planes.length}.by(-1)
    end

    it 'does not clear planes for take off if the weather is stormy' do
      allow(airport).to receive(:check_weather) {true}
      expect{airport.clear_plane_for_take_off(plane)}.to raise_error 'Permission denied, the weather is too dangerous.'
    end
  end

  it {is_expected.to respond_to(:check_weather).with(1).argument}
  describe '#check_weather' do
    it 'checks what the weather is like' do
      allow(weather).to receive(:is_stormy?) {false}
      expect(airport.check_weather(weather)).to be(false)
    end
  end
end
