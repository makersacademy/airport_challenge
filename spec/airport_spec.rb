require "airport.rb"
require "plane.rb"

describe Airport do

  let(:grounded_plane) { double :plane, flying?: false }
  let(:flying_plane) { double :plane, flying?: true }

  # Credit to Chet Sanghani for using let to instantiate plane object whilst stub not working
  let(:plane) { Plane.new }

  describe "Airport has default but changeable capacity" do

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

    it "allows you to check the weather (forcing it to be sunny)" do
      allow(subject).to receive(:weather) { "sunny" }
      expect(subject.weather).to eq "sunny"
    end

    it "allows you to check the weather (forcing it to be stormy)" do
      allow(subject).to receive(:weather) { "stormy" }
      expect(subject.weather).to eq "stormy"
    end

  end

  describe "Airport is unique and can list its own planes" do

    it "allows you to retrieve the airport's unique ID" do
      expect(subject.airport_id).to eq subject.object_id
    end

    it "returns a list of all the planes currently on the ground" do
      allow(subject).to receive(:weather) { "sunny" }
      plane_array = [Plane.new, Plane.new, Plane.new, Plane.new]
      subject.land(plane_array[0])
      subject.land(plane_array[1])
      subject.land(plane_array[2])
      subject.land(plane_array[3])
      expect(subject.list_planes).to eq plane_array
    end

  end

  context "Plane is flying" do

    it "confirms that a flying plane is not in the airport" do
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(plane)
      subject.takeoff(plane)
      expect(plane).not_to be_in_airport
    end

=begin
    before do
      allow(flying_plane).to receive(:flying).and_return(false)
    end

    it "allows a flying plane to land" do
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(flying_plane)
      expect(flying_plane).not_to be_flying
    end
=end

    it "allows a flying plane to land if it's sunny" do
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(plane)
      expect(plane).not_to be_flying
    end

    it "won't allow a flying plane to take off" do
        expect { subject.takeoff(flying_plane) }.to raise_error "Cannot take off. Plane is flying."
    end

    it "won't allow a plane to land if the airport is full" do
      allow(subject).to receive(:weather) { "sunny" }
      subject.capacity.times do
        plane.flying = true
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error "Cannot land. Airport is full."
    end

    it "won't allow a plane to land if the weather is stormy" do
      allow(subject).to receive(:weather) { "stormy" }
      expect { subject.land(plane) }.to raise_error "Cannot land due to storm."
    end

  end

  context "Plane is grounded" do

    it "confirms that a landed plane is in the airport" do
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(plane)
      expect(plane).to be_in_airport
    end

    it "allows a grounded plane to take off if it's sunny" do
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(plane)
      subject.takeoff(plane)
      expect(plane).to be_flying
    end

    # Credit to Chet Sanghani for helping me out with the method stub here
    it "won't allow a grounded plane to land" do
      allow(grounded_plane).to receive(:flying).with(no_args)
      expect { subject.land(grounded_plane) }.to raise_error "Cannot land. Plane isn't flying."
    end

    it "won't allow a plane to take off if the weather is stormy" do
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(plane)
      allow(subject).to receive(:weather) { "stormy" }
      expect { subject.takeoff(plane) }.to raise_error "Cannot take off due to storm."
    end

    it "won't allow a plane to take off if the plane is not in an airport" do
      allow(subject).to receive(:weather) { "sunny" }
      plane.flying = false
      expect { subject.takeoff(plane) }.to raise_error "Can't take off as plane is not in the airport."
    end

    it "won't allow a plane to take off if the plane is not in this particular airport" do

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

    it "allows you to instruct a specific plan to take off, not just the last one that landed" do
      allow(subject).to receive(:weather) { "sunny" }
      subject.land(plane)
      plane2 = Plane.new
      subject.land(plane2)
      subject.takeoff(plane)
      expect(subject.planes_on_ground.pop).to eq plane2
    end

  end

end
