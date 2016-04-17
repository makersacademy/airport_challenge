require 'plane'

describe Plane do
	it {is_expected.to respond_to(:land)}
	it {is_expected.to respond_to(:take_off)}
  
  describe "#take off" do
  	it {is_expected.to respond_to(:landed?)}
  	it "returns false if already flying" do
  		plane1 = Plane.new
  		allow(plane1).to receive(:flying?) {true}
  		expect(plane1.take_off).to eq false
  	end

  	it "sets state to air once taken off" do
  		plane2 = Plane.new
  		plane2.take_off
  		expect(plane2.flying?).to eq true
  	end
  end

  describe "#land" do
  	it {is_expected.to respond_to(:landed?)}
  	it "returns true if landed" do
  		plane3 = Plane.new
  		allow(plane3).to receive(:landed?) {true}
  	end
  end
end

