require 'weather'

describe Weather do 

	it {is_expected.to respond_to :generate_num}

	it {is_expected.to respond_to :stormy?}

	describe '#generate_num' do
		it 'generates a random number' do
			expect(subject.generate_num).to be_an_instance_of(Fixnum)
		end
	end

	describe '#stormy?' do
		it 'reports whether the weather is stormy' do
			weather = double("weather")
			allow(weather).to receive(:stormy?).and_return true
			expect(weather.stormy?).to eq true
			allow(weather).to receive(:stormy?).and_return false
			expect(weather.stormy?).to eq false
		end
	end
end