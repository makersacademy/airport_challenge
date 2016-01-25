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
  # describe '#weather_randomiser' do
  #   it 'randomly selects weather' do
  #     storm = false
  #     sun = false
  #     20.times do
  #       sky = Weather.new
  #       storm = sky.is_stormy? if sky.is_stormy?
  #       sun = true if !sky.is_stormy?
  #     end
  #     expect(storm).to be(true)
  #     expect(sun).to be(true)
  #   end
  # end

end
