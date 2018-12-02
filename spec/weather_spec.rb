require 'weather'
require 'airport'
describe Weather do
  let (:weather) {Weather.new}
  let (:airport) {Airport.new}
  
  context '#stormy?' do

    it 'responds to stormy?' do
      expect(weather).to respond_to(:stormy?)
    end

    it 'returns true if the weather is stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect(weather.stormy?).to eql(true)
    end

  end
end
