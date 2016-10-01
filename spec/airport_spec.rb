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
      subject.capacity = 15
      expect(subject.capacity).to eq 15
    end

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
      plane = Plane.new
      subject.takeoff(plane)
      expect(plane).to be_flying
    end

    # Credit to Chet Sanghani for helping me out with the allow method here
    it "won't allow a grounded plane to land" do
      allow(grounded_plane).to receive(:flying).with(no_args)
      expect { subject.land(grounded_plane) }.to raise_error "Cannot land. Plane isn't flying."
    end

  end

  context "Plane is flying" do

    # I need to force the weather to be sunny for this to pass consistently
    it "allows a flying plane to land" do
      plane = Plane.new
      subject.takeoff(plane)
      subject.land(plane)
      expect(plane).not_to be_flying
    end

    it "won't allow a flying plane to take off" do
        expect { subject.takeoff(flying_plane) }.to raise_error "Cannot take off. Plane is flying."
    end

    # I need to force the weather to be sunny for this to pass consistently
    it "won't allow a plane to land if the airport is full" do
      plane = Plane.new
      subject.capacity.times do
        plane.flying = true
        subject.land(plane)
      end
      expect { subject.land(flying_plane) }.to raise_error "Cannot land. Airport is full."
    end

    it "won't allow a plane to land if the weather is stormy" do
      allow(subject).to receive(:weather) { "stormy" }
      plane = Plane.new
      subject.takeoff(plane)
      expect { subject.land(plane) }.to raise_error "Cannot land due to storm."
    end

  end

end
