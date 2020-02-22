require "plane"

describe Plane do

  describe "#take_off" do
    it "Changes plane's status to 'flying'" do
      airport = Airport.new
      subject.take_off(airport)
      expect(subject.status).to eq("flying")
    end

    it "Changes plane's location to 'in the air'" do
      airport = Airport.new
      subject.take_off(airport)
      expect(subject.location).to eq("in the air")
    end
  end

  describe "#land" do
    it "Changes plane's status to 'landed'" do
      airport = Airport.new
      subject.take_off(airport)
      subject.land(airport)
      expect(subject.status).to eq("landed")
    end

    it "Changes plane's location to the appropriate airport" do
      airport = Airport.new
      subject.take_off(airport)
      subject.land(airport)
      expect(subject.location).to eq(airport.name)
    end

    it "Prevents from landing when airport is full" do
      #airport = double("airport", :name => "Heathrow", :full? => true)
      airport = Airport.new
      if airport.full?
        expect(subject.land(airport)).to eq("Cannot land as the airport is full")
      end
    end
    it "Prevents from landing when plane is already on the airport" do
      airport = Airport.new
      subject.land(airport)
      expect(subject.land(airport)).to eq("Cannot land as the plane is already on the airport")
    end
  end
end
