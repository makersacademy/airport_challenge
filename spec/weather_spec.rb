require 'weather'

describe Weather do

	let(:airport) { (Class.new {include Weather}).new }
	
	it 'expects stormy? to be true when given random number 0' do
		allow(airport).to receive(:random_number) { 0 }
		expect(airport.stormy?).to eq true
	end
	
	it 'expects stormy? to be false when given random number 1' do
		allow(airport).to receive(:random_number) { 1 }
		expect(airport.stormy?).to eq false
	end

end