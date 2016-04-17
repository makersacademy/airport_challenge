require "airport"
require "plane"
require "weather"

describe Weather do
	
	it "Returns true if stormy" do
		allow(subject).to receive (:stormy?) {true}
		expect(subject.stormy?).to be true	
	end

	it "Returns false if is not stormy" do
		allow(subject).to receive (:stormy?) {false}
		expect(subject.stormy?).to be false
	end

end