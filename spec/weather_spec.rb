require 'weather'

describe Weather do

	subject(:weather) {described_class.new}
	
	it 'is stormy' do
		allow(weather).to receive(:outlook).and_return(:stormy)
		expect(weather.stormy?).to eq true
	end

	it 'is fine' do
		allow(weather).to receive(:outlook).and_return(:fine)
		expect(weather.stormy?).to eq false
	end

	it 'returns a symbol' do
		expect(weather.outlook).to be_a(Symbol)
	end

end