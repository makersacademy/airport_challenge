require 'plane'

describe Plane do
  context "Get passangers to destination" do

    it "should output message when take_off method is called" do
      plane_id = Plane.new(999)
      expect { plane_id.take_off }.to output("Plane 999 has taken off\n").to_stdout
    end

    it "should output message when land method is called" do
      plane_id = Plane.new(999)
      expect(plane_id.land).to eq("Plane 999 has landed")
    end
  end
end
