require "airport"

describe Airport do
  describe "#takeoff" do
  	it "expects the method to exist" do
  		expect(subject).to respond_to(:takeoff)
  	end

		it "allows a plane object to take off" do
			expect(subject.takeoff).to be_kind_of Plane
		end

		it "will take off if weather is fine" do
			plane = Plane.new
			expect(plane.weather_ok?).to eq true
		end
  end
end
