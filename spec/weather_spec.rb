require 'weather'


describe Weather do
  subject(:weather) { described_class.new }

  context '#is random' do
    it 'it provides a random weather state' do
      expect([:sunny, :sunny, :stormy]).to include(weather.state)
    end
  end

  context '#stormy' do
    it 'is stormy' do
      allow(weather).to receive(:stormy?) {true}
      expect(weather).to be_stormy
    end
  end
end
