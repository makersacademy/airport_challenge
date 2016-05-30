require 'weatherforecast'

describe Weatherforecast do
	subject(:weatherforecast) {described_class.new}

	describe '#stormy' do
		it 'can be fair' do
			expect(weatherforecast.stormy?).to be false
		end
	end
	
end