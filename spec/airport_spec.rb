require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected. to respond_to(:take_off).with(1).argument }
  it { is_expected. to respond_to(:plane) }

  describe '#land' do
    it "stores a plane when a plane lands at the airport" do
      plane = Plane.new
      expect(subject.land(plane)).to include plane
    end

    it "raises an error if a plane tries to land at a full airport" do
      # Capacity of airport is 10
      10.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error ("Airport full")
    end

    it "raises an error if the same plane tries to land twice at an airport" do
      plane1 = Plane.new
      subject.land(plane1)
      expect { subject.land(plane1) }.to raise_error ("This plane is already in the airport")
    end
  end

  describe '#take_off' do

    it "raises an error if a plane tries to take off from an empty airport" do
      expect { subject.take_off(Plane.new) }.to raise_error ("This plane is not in the airport")
    end

    it "raises an error if a non existent plane tries to take off from an airport" do
      plane1 = Plane.new
      plane2 = Plane.new
      subject.land(plane1)
      expect { subject.take_off(plane2) }.to raise_error ("This plane is not in the airport")
    end

    it "raises an error if the same plane tries to take off from the airport twice." do
      plane1 = Plane.new
      subject.land(plane1)
      subject.take_off(plane1)
      expect { subject.take_off(plane1) }.to raise_error("This plane is not in the airport")
    end
  end

end

#("No planes available")
