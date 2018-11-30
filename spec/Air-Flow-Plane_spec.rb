require "Air-Flow-Plane"

describe Plane do
  context " when instructed" do
    it "Lands" do
      expect { Plane.land.to respond_to("land") }
    end
  end
end
