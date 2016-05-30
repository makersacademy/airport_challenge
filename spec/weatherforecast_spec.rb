require 'weatherforecast'

describe Weatherforecast do
	subject(:weatherforecast) {described_class.new}

	describe '#stormy' do
		it 'can be fair' do
		  allow(Kernel).to receive(:rand).and_return 1
	      expect(weatherforecast.stormy?).to be false
		end
        it 'can be stormy' do
          allow(Kernel).to receive(:rand).and_return 5
          expect(weatherforecast.stormy?).to be true
      end
	end
	
end