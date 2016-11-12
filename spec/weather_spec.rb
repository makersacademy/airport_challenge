require 'weather'

describe Weather do

	let(:dummy) { (Class.new {include Weather}).new }
	

	it 'expects stormy? to be true when given random number 0' do
		allow(dummy).to receive(:random_number) { 0 }
		expect(dummy.stormy?).to eq true
	end
	
	it 'expects stormy? to be false when given random number 1' do
		allow(dummy).to receive(:random_number) { 1 }
		expect(dummy.stormy?).to eq false
	end

end