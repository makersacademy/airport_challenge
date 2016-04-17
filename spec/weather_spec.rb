require "airport"
require "plane"
require "weather"

describe Weather do
	
	it "return true if stormy" do
		allow(subject).to receive (:stormy?) {true}
		expect(subject.stormy?).to eq true	
	end

		
end