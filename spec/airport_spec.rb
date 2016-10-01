require "airport.rb"
require "plane.rb"

describe Airport do

  let(:grounded_plane) { double :plane, flying?: false }
  let(:flying_plane) { double :plane, flying?: true }

  describe "Airport has default but changeable capacity" do

    it "has a default capacity" do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it "allows you to change the capacity" do
      subject.capacity = rand(100)
      allow(subject).to receive(:weather) { "sunny" }
      plane = Plane.new
      subject.capacity.times do
        plane.flying = true
        subject.land(plane)
      end
      expect(subject.planes_on_ground.count).to eq subject.capacity
    end

  end

  describe "Airport's weather conditions are variable" do

    it "allows you to check the weather (forcing it to be sunny)" do
      allow(subject).to receive(:weather) { "sunny" }
      expect(subject.weather).to eq "sunny"
    end

    it "allows you to check the weather (forcing it to be stormy)" do
      allow(subject).to receive(:weather) { "stormy" }
      expect(subject.weather).to eq "stormy"
    end

  end

  context "Plane is grounded" do

    it "allows a grounded plane to takeoff" do
      allow(subject).to receive(:weather) { "sunny" }
      plane = Plane.new
      subject.land(plane)
      subject.takeoff(plane)
      expect(plane).to be_flying
    end

    # Credit to Chet Sanghani for helping me out with the allow method here
    it "won't allow a grounded plane to land" do
      allow(grounded_plane).to receive(:flying).with(no_args)
      expect { subject.land(grounded_plane) }.to raise_error "Cannot land. Plane isn't flying."
    end

    it "won't allow a plane to take off if the weather is stormy" do
      allow(subject).to receive(:weather) { "sunny" }
      plane = Plane.new
      subject.land(plane)
      allow(subject).to receive(:weather) { "stormy" }
      expect { subject.takeoff(plane) }.to raise_error "Cannot take off due to storm."
    end

    it "confirms that the landed plane is in the airport" do
      allow(subject).to receive(:weather) { "sunny" }
      plane = Plane.new
      subject.land(plane)
      expect(plane).to be_in_airport
    end

    it "won't allow a plane to take off if the plane is not in the airport" do
      allow(subject).to receive(:weather) { "sunny" }
      plane = Plane.new
      plane.flying = false
      expect { subject.takeoff(plane) }.to raise_error "Can't take off as plane is not in the airport."
    end

  end

  context "Plane is flying" do

    it "allows a flying plane to land" do
      allow(subject).to receive(:weather) { "sunny" }
      plane = Plane.new
      subject.land(plane)
      expect(plane).not_to be_flying
    end

    it "won't allow a flying plane to take off" do
        expect { subject.takeoff(flying_plane) }.to raise_error "Cannot take off. Plane is flying."
    end

    it "won't allow a plane to land if the airport is full" do
      allow(subject).to receive(:weather) { "sunny" }
      plane = Plane.new
      subject.capacity.times do
        plane.flying = true
        subject.land(plane)
      end
      expect { subject.land(flying_plane) }.to raise_error "Cannot land. Airport is full."
    end

    it "won't allow a plane to land if the weather is stormy" do
      plane = Plane.new
      allow(subject).to receive(:weather) { "stormy" }
      expect { subject.land(plane) }.to raise_error "Cannot land due to storm."
    end

    it "confirms that the flying plane is not in the airport" do
      allow(subject).to receive(:weather) { "sunny" }
      plane = Plane.new
      subject.land(plane)
      subject.takeoff(plane)
      expect(plane).not_to be_in_airport
    end

  end

end
