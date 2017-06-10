require './docs/airport.rb'

describe Airport do
	it { is_expected.to respond_to :land }

	it "will return plane if land method is called" do
	      plane = Plane.new
	      expect(subject.land(plane)).to eq(plane)
	    end

	it "will confirm if a plane has landed" do
	      plane = Plane.new
				subject.land(plane)
	      expect(subject.confirm_land(plane)).to eq(true)
	    end
end
