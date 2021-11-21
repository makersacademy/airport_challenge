require "plane"

describe Plane do
	before do
		@airport = Airport.new
	end

	context "Landing:" do
		it "Responds to #land" do
				expect(subject).to respond_to :land
		end

		it "#land accepts a parameter" do
				expect { subject.land(@airport) }.to_not raise_error
		end
	end

	context "Takeoff:" do
		it "Responds to #takeoff" do
				expect(subject).to respond_to :takeoff
		end

		it "#takeoff accepts a parameter" do
				expect { subject.takeoff(@airport) }.to_not raise_error
		end
	end
	
end