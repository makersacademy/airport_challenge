require "airport.rb"

describe Airport do

  describe '#land' do
    it "has a land method with one argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "lands a plane at the airport" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    it "cannot land a plane that has already landed" do
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error("Plane has already landed")
    end

    it "cannot land a plane when the airport is full" do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error("Cannot land, this airport is full")
    end

  end

  describe '#confirm_status' do
    it "confirms the status of the plane" do
      plane = Plane.new
      expect(subject.confirm_status(plane)).to eq(nil)
    end

    it "confirms that the plane has landed/arrived" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.confirm_status(plane)).to eq("arrived")
    end

    it "confirms that the plane has departed" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.confirm_status(plane)).to eq("departed")
    end
  end

  describe '#take_off' do
    it "instructs a plane to take off" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "confirms the plane is no longer in the airport" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end
  end
    it "raises error when a plane is not in the airport" do
      plane = Plane.new
      expect { subject.take_off(plane) }.to raise_error("this plane is not available for take off or has already left")
    end

  describe '#full?' do

    it "can check if the aiport is full" do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect(subject.full?).to eq true
    end
  end
end
