require "plane"

describe Plane do

	context "plane lands"
	it "has a #land method on its interface" do
		expect(subject).to respond_to(:land)
	end

end