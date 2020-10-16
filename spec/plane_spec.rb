require 'plane'

describe Plane do
  let(:subject) { Plane.new("location") }

  describe "creating a plane" do
    it "returns an instance of Plane" do
      expect(subject).to be_instance_of(Plane)
    end

    it "has an accessible location attribute" do
      expect(subject).to respond_to(:location)
    end
  end

  describe "#takeoff" do
    context "plane was landed" do
      it "sets location to flying" do
        subject.takeoff
        expect(subject.location).to eq(:flying)
      end
    end

    context "plane is already flying" do
      it "raises an error" do
        plane = Plane.new(:flying)
        error_message = "Plane is already flying"
        expect { plane.takeoff }.to raise_error(error_message)
      end
    end
  end

  describe "#land" do
    context "plane was flying" do
      it "lands the plane at an airport" do
        airport = double(:airport)
        plane = Plane.new(:flying)
        allow(airport).to receive(:class).and_return(Airport)
        plane.land(airport)
        expect(plane.location.class).to eq(Airport)
      end
    end

    context "plane is already landed" do
      it "does nothing" do
        airport1 = double(:airport)
        airport2 = double(:airport)
        plane = Plane.new(airport1)
        error_message = "Plane is already landed"
        expect { plane.land(airport2) }.to raise_error(error_message)
      end
    end
  end
end
