require 'weather'


describe Weather do
  subject(:weather_state) { described_class.new }

  context 'is random' do
    it 'it provides a random weather state' do
      expect([:sunny, :sunny, :stormy]).to include(weather_state.state)
    end
  end

  # it 'responds to the method set weather' do
  #   expect(subject).to respond_to(:set_weather)
  # end
  #
  # it 'responds to the method stormy?' do
  #   expect(subject).to respond_to(:stormy?)
  # end
  #
  # it 'method stormy responds true if weather is stormy' do
  #   weather = (Weather.new)
  #   allow(weather).to receive(:weather_rand) {2}
  #   weather.set_weather
  #   expect(weather.stormy?).to eq(true)
  # end
  #
  # it 'method stormy responds false if weather is sunny' do
  #   weather = (Weather.new)
  #   allow(weather).to receive(:weather_rand) {1}
  #   weather.set_weather
  #   expect(weather.stormy?).to eq(false)
  # end

end
