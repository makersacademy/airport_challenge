require 'weather'

describe Weather do
	subject(:weather) { described_class.new }


	it 'the weather has a default status' do
  		expect(weather.at_the_moment).to eq(Weather::STORMY)
  	end


	describe 'attributes' do

 		it { is_expected.to respond_to :at_the_moment }
 		it { is_expected.to respond_to :at_the_moment= }

 		it 'allows for reading and writing for weather :at_the_moment' do
    		weather.at_the_moment = 'sunny'
    		expect(weather.at_the_moment).to eq('sunny')
    	end
 	end

 	describe '#stormy?' do
 		it 'says whether it is stormy outside' do
 			allow(weather).to receive(:stormy?).and_return false
 			expect(weather.stormy?).to eq(false)
 		end
 	end

end