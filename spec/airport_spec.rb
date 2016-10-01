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

  end

  context "Plane is grounded" do

    it "allows a grounded plane to takeoff" do
      # could not get my stub to work. something wrong with the syntax?
      plane = Plane.new
      subject.takeoff(plane)
      expect(plane).to be_flying
    end

    it "won't allow a grounded plane to land" do
      expect { subject.land(grounded_plane) }.to raise_error "Cannot land. Plane isn't flying."
    end

  end

  context "Plane is flying" do

    it "allows a flying plane to land" do
      plane = Plane.new
      subject.takeoff(plane)
      subject.land(plane)
      expect(plane).not_to be_flying
    end

    it "won't allow a flying plane to take off" do
        expect { subject.takeoff(flying_plane) }.to raise_error "Cannot take off. Plane is flying."
    end

    it "won't allow a plane to land if the airport is full" do
      plane = Plane.new
      subject.capacity.times do
        plane.flying = true
        subject.land(plane)
      end
      expect { subject.land(flying_plane) }.to raise_error "Cannot land. Airport is full."
    end

  end

end
