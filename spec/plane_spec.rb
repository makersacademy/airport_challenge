require 'plane'

describe Plane do
  context "When using the Plane class" do
    
    it "should tell us which airport it is landing in" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      subject.land(airport)
      expect(subject.airport).to eq(airport.airport_id)
    end

    it "should tell us if the plane is flying" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      subject.land(airport)
      subject.take_off(airport)
      expect(subject.flying?).to eq(true)
    end

    it "should not be assigned to an airport while flying" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      subject.land(airport)
      subject.take_off(airport)
      expect(airport.in_airport?(subject)).to be(false)
      expect(subject.airport).to eq("")
    end

    it "should be able to change the flight status" do
      subject.change_status("Heathrow", true)
      expect(subject.flying).to eq(true)
      expect(subject.airport).to eq("Heathrow")
    end

  end

  context "During Take Off" do
    it "should let planes take off during sunny weather" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      subject.land(airport)
      expect(subject.take_off(airport)).to eq(airport)
    end

    it "should raise an error if trying to take off when stormy" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      subject.land(airport)
      allow(airport).to receive(:stormy?).and_return(true)
      expect { subject.take_off(airport) }.to raise_error "Can't take off due to stormy weather!"
    end

    it "should raise an error when trying to take off from the wrong airport" do
      airport_a = Airport.new
      airport_b = Airport.new

      allow(airport_a).to receive(:stormy?).and_return(false)
      allow(airport_b).to receive(:stormy?).and_return(false)

      subject.land(airport_a)
      expect { subject.take_off(airport_b) }.to raise_error "This plane is not at this airport"
    end

    it "should raise an error when trying to take off when already flying" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      subject.land(airport)
      subject.take_off(airport)
      expect { subject.take_off(airport) }.to raise_error "This plane is already flying"
    end

  end

  context "During Landing" do

    it "should be able to land during sunny weather" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      expect(subject.land(airport)).to eq(airport)
    end

    it "should raise an error if trying to land during stormy weather" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(true)
      expect { subject.land(airport) }.to raise_error "Can't land due to stormy weather!"
    end

    it "should raise an error if a trying to land when the airport hangar is full" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      40.times { Plane.new.land(airport) }
      expect { Plane.new.land(airport) }.to raise_error "Can't land, hangar is full!"
    end

    it "should raise an error when trying to land when already on ground" do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error "Plane already in airport!"
    end

  end

end
