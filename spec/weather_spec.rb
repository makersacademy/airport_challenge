require 'weather'

describe Weather do
	
	it "It returns whether it is stormy or not" do
		allow(Weather::OUTLOOKS).to receive(:sample).and_return(:stormy)
		expect(subject.stormy?).to eq true
	end
end