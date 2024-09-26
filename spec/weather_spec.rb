require 'weather'

describe Weather do
    subject(:weather) { described_class.new }
    
    describe '#stormy?' do
     it 'is sunny' do
        allow(Kernel).to receive(:rand)
        expect(weather.stormy?)
    end
end
end