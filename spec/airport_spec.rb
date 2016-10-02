require "airport.rb"
require "plane.rb"

describe Airport do

  let(:landed_plane) { double :plane, flying?: false }
  let(:flying_plane) { double :plane, flying?: true }

  # Credit to Chet Sanghani for using let to instantiate plane object so that it's reusable
  let(:plane) { Plane.new }

  # Credit to Chet Sanghani for helping me out with the method stub in line 16
  context "Checks plane's eligibility for landing" do

    it "checks that the plane is flying" do
      allow(landed_plane).to receive(:flying).with(no_args)
      expect { subject.land(landed_plane) }.to raise_error "Cannot land. Plane isn't flying."
    end

    it "checks that the plane is not already in the airport" do
      expect(subject.planes_on_ground.include?(plane)).to eq false
    end

    it "won't allow the plane to land if the weather is stormy" do
      allow(subject).to receive(:weather) { "stormy" }
      expect { subject.land(plane) }.to raise_error "Cannot land due to storm."
    end

    it "won't allow the plane to land if the airport is full" do
      allow(subject).to receive(:weather) { "sunny" }
      subject.capacity.times do
        plane.flying = true
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error "Cannot land. Airport is full."
    end

  end

  context "Instructs plane to land" do

    it "instructs the plane to land (provided it's sunny)" do
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(plane)
      expect(plane).not_to be_flying
    end

    it "having landed, confirms that the plane is in the airport" do
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(plane)
      expect(subject.planes_on_ground.include?(plane)).to eq true
    end

  end

  context "Checks plane's eligibilty for take off" do

    it "checks that the plane is not already flying" do
      expect { subject.takeoff(flying_plane) }.to raise_error "Cannot take off. Plane is flying."
    end

    it "checks that the plane is in the airport" do
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(plane)
      expect(subject.planes_on_ground.include?(plane)).to eq true
    end

    it "checks multiple airports to make sure the plane is definitely in THIS airport" do
      Heathrow = Airport.new
      allow(Heathrow).to receive(:weather) { "sunny" }
      plane1 = Plane.new
      Heathrow.land(plane1)
      Gatwick = Airport.new
      allow(Gatwick).to receive(:weather) { "sunny" }
      plane2 = Plane.new
      Gatwick.land(plane2)
      expect { Gatwick.takeoff(plane1) }.to raise_error "Can't take off as plane is not in the airport."
    end

    it "won't allow a plane to take off if the weather is stormy" do
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(plane)
      allow(subject).to receive(:weather) { "stormy" }
      expect { subject.takeoff(plane) }.to raise_error "Cannot take off due to storm."
    end

  end

  context "Instructs plane to take off" do

    it "instructs a plane to take off (provided it's sunny)" do
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(plane)
      subject.takeoff(plane)
      expect(plane).to be_flying
    end

    it "having taken off, confirms that the plane is no longer in the airport" do
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes_on_ground.include?(plane)).to eq false
    end

    it "instructs a specific plane to take off (not just the most recently landed)" do
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(plane)
      plane2 = Plane.new
      subject.land(plane2)
      subject.takeoff(plane)
      expect(subject.planes_on_ground.include?(plane)).to eq false
    end

  end

  describe "Airport has a default but changeable capacity" do

    it "has a default capacity" do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it "allows you to change the capacity" do
      subject.capacity = rand(100)
      allow(subject).to receive(:weather) { "sunny" }
      subject.capacity.times do
        plane.flying = true
        subject.land(plane)
      end
      expect(subject.planes_on_ground.count).to eq subject.capacity
    end

  end

  describe "Airport's weather conditions are variable" do

    it "checks that the weather is either sunny or stormy" do
      weather_conditions = ["sunny", "stormy"]
      expect(weather_conditions.include?(subject.weather)).to eq true
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

end
