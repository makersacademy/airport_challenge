require "plane"

describe Plane do
	
	before do
		@airport = double("Airport", :planes => [])
		allow(@airport).to receive_messages(:remove_plane => nil, :add_plane => nil)
	end

	subject { Plane.new(@airport) }

	it "Plane has to be given a starting airport when created" do
		expect { Plane.new }.to raise_error
	end	

	context "Landing:" do
		it "Responds to #land" do
			expect(subject).to respond_to :land
		end

		it "#land requires a parameter" do
				expect { subject.land }.to raise_error
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

	context "State of plane:" do

		it "Plane cannot land if not flying" do
		
		end

		it "Plane cannot takeoff if already flying" do
		
		end
	end


end