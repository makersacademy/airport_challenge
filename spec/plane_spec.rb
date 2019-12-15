require "plane"

describe Plane do
  describe "#land" do
    it "Changes the plane's status to landed" do
      airport = double("airport", :name => "Heathrow", :full? => false, :land => "Plane landed successfully at airport")
      subject.land(airport)
      expect(subject.status).to eq("landed")
    end
    it "Changes the plane's location to the appropriate airport" do
      airport = double("airport", :name => "Heathrow", :full? => false, :land => "Plane landed successfully at airport")
      subject.land(airport)
      expect(subject.location).to eq(airport.name)
    end
    it "Returns Plane landed successfully at airport" do
      airport = double("airport", :name => "Heathrow", :full? => false, :land => "Plane landed successfully at airport")
      expect(subject.land(airport)).to eq("Plane landed successfully at airport")
    end
    it "Prevents landing if plane is already on the ground" do
      airport = double("airport", :name => "Heathrow", :full? => false, :land => "Plane landed successfully at airport")
      subject.land(airport)
      expect(subject.land(airport)).to eq("Plane is already on the ground")
    end
    it "Prevents landing if airport is full" do
      airport = double("airport", :name => "Heathrow", :full? => true, :land => "Plane landed successfully at airport")
      expect(subject.land(airport)).to eq("Plane unable to land as airport is full")
    end
  end

  describe "#take_off" do
    it "Prevents takeoff if plane is not at the specified airport" do
      airport1 = double("airport", :name => "Heathrow", :full? => false, :land => "Plane landed successfully at airport")
      airport2 = double("airport", :name => "Gatwick", :full? => false, :land => "Plane landed successfully at airport")
      subject.land(airport1)
      expect(subject.take_off(airport2)).to eq("Plane not at that airport")
    end
    it "Changes the plane's status to flying" do
      airport = double("airport", :name => "Heathrow", :full? => false, :land => "Plane landed successfully at airport", :take_off => "Plane took off successfully from airport")
      subject.land(airport)
      subject.take_off(airport)
      expect(subject.status).to eq("flying")
    end
    it "Changes the plane's location to in the air" do
      airport = double("airport", :name => "Heathrow", :full? => false, :land => "Plane landed successfully at airport", :take_off => "Plane took off successfully from airport")
      subject.land(airport)
      subject.take_off(airport)
      expect(subject.location).to eq("in the air")
    end
    it "Returns Plane took off successfully from airport" do
      airport = double("airport", :name => "Heathrow", :full? => false, :land => "Plane landed successfully at airport", :take_off => "Plane took off successfully from airport")
      subject.land(airport)
      expect(subject.take_off(airport)).to eq("Plane took off successfully from airport")
    end
  end
end
