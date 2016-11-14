require 'airport'
describe Airport do
  subject(:airport) {described_class.new}

  it { is_expected.to be_instance_of(Airport) }

  context "@capacity" do

    it "has a defeault capacity" do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "has capacity that can be changed on airport creation" do
      expect((Airport.new(21)).capacity).to eq 21
    end

    it "has a capacity that can be changed overtime" do
      airport.capacity = 20
      expect(airport.capacity).to eq 20
    end
  end

  describe "#land" do

    it "doesn't allow plane to land if weather stormy" do
      message = "Landing impossible due to stormy weather"
      plane = Plane.new
      allow(airport).to receive(:stormy?) { true }
      expect { airport.land(plane) }.to raise_error(message)
    end

    describe "tests that need sunny weather" do
      before do
        allow(airport).to receive(:stormy?) { false }
      end

      it "lands a plane" do
        plane = Plane.new
        airport.land(plane)
        expect(airport.on_airport?(plane)).to eq true
      end

      it "confirms that a plane has just landed" do
        plane = Plane.new
        expect(airport.land(plane)).to eq "The plane has landed"
      end

      it "Doesn't allow planes to land if full" do
        message = "This airport is full"
        (airport.capacity).times { airport.land(Plane.new)}
        expect { airport.land(Plane.new) }.to raise_error(message)
      end

      it "Changes plane state to 'landed' when landing the plane" do
        plane = Plane.new
        airport.land(plane)
        expect(plane.state).to eq :landed
      end

      it "doesn't allow a plane to land if it is already landed" do
        message = "This plane is already landed"
        plane = Plane.new
        airport.land(plane)
        expect {airport.land(plane)}.to raise_error(message)
      end
    end
  end

  describe "#take_off" do

    it "doesn't allow plane to take off if weather stormy" do
      message = "Take-off impossible due to stormy weather"
      plane = Plane.new
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      allow(airport).to receive(:stormy?) { true }
      expect { airport.take_off(plane) }.to raise_error(message)
    end

    describe "tests that need sunny weather" do
      before do
        allow(airport).to receive(:stormy?) { false }
      end
      it "instructs a plane to take_off" do
        plane = Plane.new
        airport.land(plane)
        airport.take_off
        expect(airport.on_airport?(plane)).to be false
      end

      it "changes plane state to :flying during take-off" do
        plane = Plane.new
        airport.land(plane)
        airport.take_off
        expect(plane.state).to eq :flying
      end

      it "confirms that the plane has just taken off" do
        plane = Plane.new
        airport.land(plane)
        expect(airport.take_off(plane)).to eq "The plane has taken off"
      end

      it "plane can take off only from an airport it is landed in" do
        message = "This plane is not present at this airport!"
        expect {airport.take_off(Plane.new)}.to raise_error(message)
      end

      it "does not allow flying plane to use airport/take off" do
        message = "This plane cannot use an airport when flying!"
        plane = Plane.new
        airport.land(plane)
        plane.state = :flying
        expect {airport.take_off}.to raise_error(message)
      end

      it "takes-off correct plane" do
        plane = Plane.new
        airport.land(plane)
        airport.land(Plane.new)
        airport.take_off(plane)
        expect(airport.on_airport?(plane)).to be false
      end
    end
  end

end
