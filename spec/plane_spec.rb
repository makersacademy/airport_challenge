require "plane"

describe Plane do

  describe "#take_off" do
    it "Changes plane's status to 'flying'" do
      airport = double("airport", :name => "airport", :take_off => "Plane successfully took off from the airport")
      subject.take_off(airport)
      expect(subject.status).to eq("flying")
    end

    it "Changes plane's location to 'in the air'" do
      airport = double("airport", :name => "airport", :take_off => "Plane successfully took off from the airport")
      subject.take_off(airport)
      expect(subject.location).to eq("in the air")
    end

    it "Prevents from taking off from airport when a plane is at the different airport" do
      airport1 = double("airport", :name => "Heathrow", :full? => false, :take_off => "Plane successfully took off from the airport", :land => "Plane successfully landed on the airport")
      airport2 = double("airport", :name => "Gatwick")
      subject.take_off(airport1)
      subject.land(airport1)
      expect(subject.take_off(airport2)).to eq("Cannot take off as the plane is at the different airport")
    end
  end

  describe "#land" do
    it "Changes plane's status to 'landed'" do
      airport = double("airport", :name => "Heathrow", :full? => false)
      subject.take_off(airport)
      subject.land(airport)
      expect(subject.status).to eq("on the ground")
    end

    it "Changes plane's location to the appropriate airport" do
      airport = double("airport", :name => "airport", :full? => false, :take_off => "Plane successfully took off from the airport", :land => "Plane successfully landed on the airport")
      subject.take_off(airport)
      subject.land(airport)
      expect(subject.location).to eq(airport.name)
    end

    it "Prevents from landing when airport is full" do
      airport = double("airport", :full? => true)
      expect(subject.land(airport)).to eq("Cannot land as the airport is full")
    end

    it "Prevents from landing when plane is already on the airport" do
      airport = double("airport", :full? => false)
      subject.land(airport)
      expect(subject.land(airport)).to eq("Cannot land as the plane is already on the airport")
    end
  end
end
