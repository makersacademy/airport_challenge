require 'weather'

describe Weather do 
	subject(:weather) {described_class.new}

	describe '#stormy?' do
		it 'can be non-stormy' do
			expect(weather.stormy?).to be false
		end
	end
end