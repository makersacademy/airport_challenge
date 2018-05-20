require 'weather'

describe Weather do
	subject(:weather) { described_class.new }


	describe '#stormy?' do
		it 'says whether it is stormy outside' do
			allow(Kernel).to receive(:rand).and_return 1
			expect(weather.stormy?).to be(false)
		end

		it 'says whether it is nice weather outside' do
			allow(Kernel).to receive(:rand).and_return 8
			expect(weather.stormy?).to be(true)
		end
	end

end