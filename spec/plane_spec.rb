require "plane"

describe Plane do 
	it "takes off" do 
	end
	it "lands" do
		plane = Plane.new(false)
		expect(plane.lands).to eq(true)
	end
end
