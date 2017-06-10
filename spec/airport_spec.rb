require './docs/airport.rb'

describe Airport do
	it { is_expected.to respond_to :land }

	it "will record that a plane is at airport if land method is called" do
	      plane = Plane.new
	      expect(subject.land(plane)).to eq([plane])
	    end

	it "will confirm if a plane has landed" do
	      plane = Plane.new
				subject.land(plane)
	      expect(subject.confirm_land(plane)).to eq(true)
	    end

	it { is_expected.to respond_to :take_off }

	it "will record that a plane has taken off when the take off method is called" do
				plane = Plane.new
				subject.land(plane)
				subject.take_off(plane)
				expect(subject.planes).not_to include(plane)
			end

	it "has a default setting of empty (no planes)" do
				expect(subject.planes).to eq []
			end
end
