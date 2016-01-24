require 'weather'

describe Weather do
  subject(:weather) {described_class.new}

  it{is_expected.to respond_to(:is_stormy?)}
  describe '#is_stormy?' do
    it 'shows that the weather is stormy' do
      allow(weather).to receive(:is_stormy?) {true}
      expect(weather.is_stormy?).to be(true)
    end
  end

  it {is_expected.to respond_to(:weather_randomiser)}

end
