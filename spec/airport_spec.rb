require 'airport'
describe Airport do

  it { is_expected.to be_instance_of(Airport) }

  context "@capacity" do
    it "has a default capacity that can be changed on airport creation" do
      expect((Airport.new(21)).capacity).to eq 21
    end

    it "has a capacity that can be changed overtime" do
      subject.capacity = 20
      expect(subject.capacity).to eq 20
    end
  end

  describe "#land" do

    it "doesn't allow plane to land if weather stormy" do
      message = "Landing impossible due to stormy weather"
      plane = Plane.new
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(plane) }.to raise_error(message)
    end

    describe "tests that need sunny weather" do
      before do
        allow(subject).to receive(:stormy?) { false }
      end
      it "tells a plane to land" do
        plane = Plane.new
        subject.land(plane)
        expect(plane).to eq subject.planes.last
      end

      it "confirms that a plane has just landed" do
        plane = Plane.new
        expect(subject.land(plane)).to eq "The plane has landed"
      end

      it "Doesn't allow planes to land if full" do
        message = "This airport is full"
        (subject.capacity).times { subject.land(Plane.new)}
        expect { subject.land(Plane.new) }.to raise_error(message)
      end

      it "Changes plane state to 'landed' when landing the plane" do
        plane = Plane.new
        subject.land(plane)
        expect(plane.state).to eq :landed
      end

      it "doesn't allow a plane to land if it is already landed" do
        message = "This plane is already landed"
        plane = Plane.new
        subject.land(plane)
        expect {subject.land(plane)}.to raise_error(message)
      end
    end
  end

  describe "#on_airport?" do
    it "confirms that a plane is landed there/has not taken off" do
      plane = Plane.new
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      expect(subject.on_airport?(plane)).to eq true
    end

    it "informs if the plane is not landed at this airport/has taken off" do
      expect(subject.on_airport?(Plane.new)).to eq false
    end
  end

  describe "#take_off" do

    it "doesn't allow plane to take off if weather stormy" do
      message = "Take-off impossible due to stormy weather"
      plane = Plane.new
      allow(subject).to receive(:stormy?) { false }
      subject.land(plane)
      allow(subject).to receive(:stormy?) { true }
      expect { subject.take_off(plane) }.to raise_error(message)
    end

    describe "tests that need sunny weather" do
      before do
        allow(subject).to receive(:stormy?) { false }
      end
      it "instructs a plane to take_off" do
        plane = Plane.new
        subject.land(plane)
        subject.take_off
        expect(subject.planes).not_to include plane
      end

      it "changes plane state to :flying during take-off" do
        plane = Plane.new
        subject.land(plane)
        subject.take_off
        expect(plane.state).to eq :flying
      end

      it "confirms that the plane has just taken off" do
        plane = Plane.new
        subject.land(plane)
        expect(subject.take_off(plane)).to eq "The plane has taken off"
      end

      it "plane can take off only from an airport it is landed in" do
        message = "This plane is not present at this airport!"
        expect {subject.take_off(Plane.new)}.to raise_error(message)
      end

      it "does not allow flying plane to use airport/take off" do
        message = "This plane cannot use an airport when flying!"
        plane = Plane.new
        subject.land(plane)
        plane.state = :flying
        expect {subject.take_off}.to raise_error(message)
      end

      it "takes-off correct plane" do
        plane = Plane.new
        subject.land(plane)
        subject.land(Plane.new)
        subject.take_off(plane)
        expect(subject.planes).not_to include(plane)
      end
    end
  end

end
