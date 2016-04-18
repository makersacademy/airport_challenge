require 'airport'
require 'rspec/expectations'

describe Airport do

	describe "#initalize" do
		it "has an empty planes array" do
		expect(subject.planes.empty?).to eq true
	  end
	end

	describe "#airport_landing" do

		it "accepts a plane to land" do
			allow(subject).to receive(:stormy?) {false}
	    plane = Plane.new
	    subject.airport_landing(plane)
	    expect(subject.planes.empty?).to be false
  	end

		it "cannot land in a storm" do
			allow(subject).to receive(:stormy?) {true}
			plane = Plane.new
			expect {subject.airport_landing(plane)}.to raise_error "can't land when stormy"
  	end

	  it "raises an error when trying to land when stormy" do
	    allow(subject).to receive(:rand) {2}
	    plane = Plane.new
	    expect{subject.stormy?; subject.airport_landing(plane)}.to raise_error "can't land when stormy"
	  end
	end

	describe "#airport_take_off" do

		it "allows a plane to take off" do
			allow(subject).to receive(:stormy?) {false}
			plane = Plane.new
		  subject.airport_landing(plane)
			subject.airport_take_off(plane) 
			expect(subject.planes.empty?).to eq true
		end

		it "raises an error when stormy and can't take off" do
			allow(subject).to receive(:stormy?) {false}
      plane = Plane.new
      subject.airport_landing(plane)
      allow(subject).to receive(:stormy?) {true}
      expect {subject.airport_take_off(plane)}.to raise_error "can't take off when stormy"
		end
	end
end	

