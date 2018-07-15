require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe 'changeable weather' do
    it 'can be stormy weather' do
      allow(Kernel).to receive(:rand).and_return 4
      expect(weather.storm?).to be true
    end
    it 'can be fair weather' do
      allow(Kernel).to receive(:rand).and_return 1
      expect(weather.storm?).to be false
    end
  end
end
# Kernel.stub!(:rand).and_return( *test_values )
