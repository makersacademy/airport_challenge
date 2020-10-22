require 'plane'

RSpec.describe Plane do

  it "lands at an airport" do
    Airport.any_instance.stub(:weather) { false }
    Airport.any_instance.stub(:full?) { false }
    airport = Airport.new
    subject.land(airport)
    expect(airport.at_airport?(subject)).to eq true
  end

  it "takes off from an airport and confirms" do
    Airport.any_instance.stub(:weather) { false }
    Airport.any_instance.stub(:full?) { false }
    airport = Airport.new
    subject.land(airport)
    expect(subject.take_off(airport)).to be_a(String)
    expect(airport.at_airport?(subject)).to eq false
  end

  describe "Errors" do
    context "landing errors" do

      it "does not land if airport is full" do
        Airport.any_instance.stub(:weather) { false }
        airport = Airport.new(1)
        plane = Plane.new
        subject.land(airport)
        message = 'Airport is full.'
        expect { plane.land(airport) }.to raise_error(RuntimeError, message)
      end

      it "does not land if airport is stormy" do
        Airport.any_instance.stub(:weather) { true }
        airport = Airport.new
        message = 'Weather is stormy. Cannot land.'
        expect { subject.land(airport) }.to raise_error(RuntimeError, message)
      end

      it "does not land if already landed" do
        Airport.any_instance.stub(:weather) { false }
        airport1 = Airport.new
        airport2 = Airport.new
        subject.land(airport1)
        message = "Plane has already landed at #{airport1}."
        expect { subject.land(airport2) }.to raise_error(RuntimeError, message)
      end
    end

    context "take off errors" do
      it "does not take off if airport is stormy" do
        Airport.any_instance.stub(:weather) { false }
        airport = Airport.new
        subject.land(airport)
        Airport.any_instance.stub(:weather) { true }
        message = 'Weather is stormy. Cannot take off.'
        expect { subject.take_off(airport) }.to raise_error(RuntimeError, message)
      end

      it "does not take off if already flying" do
        airport = Airport.new
        message = 'This plane is already flying.'
        expect { subject.take_off(airport) }.to raise_error(RuntimeError, message)
      end

      it "does not take off if not at the specified airport" do
        Airport.any_instance.stub(:weather) { false }
        airport1 = Airport.new
        airport2 = Airport.new
        subject.land(airport1)
        message = 'This plane is not at the specified airport.'
        expect { subject.take_off(airport2) }.to raise_error(RuntimeError, message)
      end
    end

  end

end
