require 'airport'

describe Airport do
  let (:plane) {double :plane, land: true, take_off: false}
  
  describe "#land" do
  	it "lands a plane" do
  		expect(subject.allow_landing(plane).last).to eq plane
  	end
  end

  describe "#allow_take_off" do
  	it "allows a plane to take off" do
  		subject.allow_landing(plane)
  		expect(subject.allow_take_off).to eq plane
  	end
  end

end
