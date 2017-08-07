require 'airport'

describe Airport do


	it "should respond to take_off method" do
		expect(subject).to respond_to(:take_off)
	end

	describe "#land" do

		it "should respond to land method" do
			expect(subject).to respond_to(:land).with(1).argument
		end

		it "shouldn't allow a plane to land if it's stormy" do
			plane = Plane.new
			airport = Airport.new
			allow(subject).to receive(:stormy?) { true }
			# expect { subject.stormy? }.to raise_error "It's too stormy! The plane can't land now!"
		end
	end

	it "shouldn't allow a plane to take off if it's stormy" do
		plane = Plane.new
		airport = Airport.new
		allow(subject).to receive(:stormy?) { true }
		# expect { subject }.to raise_error("It's too stormy! The plane can't take off now!")
	end

	it "should respond to full? method" do
		expect(subject).to respond_to(:full?)
	end

end