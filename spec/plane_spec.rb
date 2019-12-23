require "plane.rb"

describe Plane do
  
  let(:airport1) { double("Airport") }
  let(:airport2) { double("Airport") }

  describe "#land_at" do
    it "raises error if plane landed at other airport already" do
      subject.land_at(airport1)
      expect { subject.land_at(airport2) }.to raise_error ("Plane already landed at another airport")
    end 
  end

end