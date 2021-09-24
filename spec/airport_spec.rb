require 'airport'

RSpec.describe Airport do
  let(:plane) { instance_double(Plane, :is_a? => Plane) }
  let(:plane_1) { instance_double(Plane, :is_a? => Plane) }

  describe "#initialize" do
    it "initializes with a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "sets a custom capacity given" do
      bigger_airport = Airport.new(20)
      expect(bigger_airport.capacity).to eq 20
    end

    it "raises error unless positive integer given" do
      expect { Airport.new(-1) }.to raise_error(ArgumentError, "Please enter a positive integer")
      expect { Airport.new("1") }.to raise_error(ArgumentError, "Please enter a positive integer")
      expect { Airport.new(0) }.to raise_error(ArgumentError, "Please enter a positive integer")
      expect { Airport.new(3.5) }.to raise_error(ArgumentError, "Please enter a positive integer")
    end
  end

  describe "#land" do
    it "raises error when anything other than plane given" do
      expect { subject.land }.to raise_error(ArgumentError, "Plane not given")
      expect { subject.land(Object.new)}.to raise_error(ArgumentError, "Plane not given")
    end

    it "lands a plane" do
      subject.land(plane)
      expect(subject.planes.include?(plane)).to be true
    end

    it "doesn't land a plane already in the airport" do
      subject.land(plane)

      expect {subject.land(plane)}.to raise_error "Plane already in airport"
    end

    it "doesn't land planes when airport full" do
      smol_airport = Airport.new(1)
      smol_airport.land(plane)

      expect { smol_airport.land(plane_1) }.to raise_error "Airport full"
    end
  end

  describe "#take_off" do
    it "raises error when anything other than plane given" do
      expect { subject.take_off }.to raise_error(ArgumentError, "Plane not given")
      expect { subject.take_off(Object.new) }.to raise_error(ArgumentError, "Plane not given")
    end

    it "takes off a plane" do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to_not include plane
    end

    it "doesn't take off a plane when not in airport" do
      expect { subject.take_off(plane) }.to raise_error "Plane not in airport"
    end

    it "confirms a plane has taken_off" do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq "Plane has taken off"
    end

    it "only takes off the plane given" do
      subject.land(plane)
      subject.land(plane_1)
      subject.take_off(plane)
      expect(subject.planes).to include plane_1
    end
  end
end