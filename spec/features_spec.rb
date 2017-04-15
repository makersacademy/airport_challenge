require 'Airport'


describe Airport do
	it "tests if a controller can instruct plane to land and confirm landing" do
		plane = Plane.new
		expect(subject.land(plane)).to eq [subject.landed.last]
	end

	it "tests if a controller can instruct plane to takeoff and confirm it is no longer there" do
		plane = Plane.new
		subject.land(plane)
		expect(subject.takeoff).to eq plane.id
	end
end