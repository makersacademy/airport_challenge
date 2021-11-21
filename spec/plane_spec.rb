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

		it "Plane cannot land if not flying" do
			expect { subject.land(@airport) }.to raise_error "Plane already landed"
		end

		it "Sets state of plane to landed after landing" do
			allow(@airport).to receive(:planes).and_return([subject])
			subject.takeoff(@airport)
			subject.land(@airport)
			expect(subject.flying).to eq false
		end
	end

	context "Takeoff:" do

		before do
			allow(@airport).to receive(:planes).and_return([subject])
		end

		it "Responds to #takeoff" do
				expect(subject).to respond_to :takeoff
		end

		it "#takeoff accepts a parameter" do
			expect { subject.takeoff(@airport) }.to_not raise_error
		end

		it "Plane cannot takeoff if already flying" do
			subject.takeoff(@airport)
			expect { subject.takeoff(@airport) }.to raise_error "Plane already flying"
		end

		it "Sets state of plane to flying after takeoff" do
			subject.takeoff(@airport)
			expect(subject.flying).to eq true
		end

		it "Cannot takeoff from airport if stored at different airport" do
			airport = double("Airport", :planes => [])
			expect { subject.takeoff(airport) }.to raise_error "Plane at different airport"
		end
	end

end