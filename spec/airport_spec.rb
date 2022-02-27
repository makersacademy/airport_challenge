require 'airport'
require 'plane'

describe Airport do
  describe ".land" do
    it 'will not raise an error when a plane lands at the airport ' do
      plane = Plane.new
      expect { subject.land(plane) }.to_not raise_error
    end

    it "will land a plane at the airport" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.return_planes).to match_array([plane])
    end

    it "will not allow to land plane when airport capcity is reached" do
      subject.capacity.times { subject.land(Plane.new) }
      expect {subject.land(Plane.new)}.to raise_error("Airport capacity is reached")
    end
  end

  describe ".take_off" do
    it 'will not raise an error when a plane takes off' do
      plane = Plane.new
      subject.land(plane)
      expect { subject.take_off(plane) }.to_not raise_error
    end

    it "will raise an error if no plane is available to take off" do
      plane = Plane.new
      subject.return_planes.count == 0
      expect { subject.take_off(plane) }.to raise_error("No plane available to take off")
    end

    it "will raise an error when a plane taking off is not in the airport" do
      plane1 = Plane.new
      plane2 = Plane.new
      subject.land(plane1)
      expect { subject.take_off(plane2) }.to raise_error("Plane not available to take off")
    end

    it "will confirm that the plane has taken off and is no longer in the airport" do
      plane1 = Plane.new
      plane2 = Plane.new
      subject.land(plane1)
      subject.land(plane2)
      expect(subject.return_planes).to match_array [plane1, plane2]
      subject.take_off(plane1)
      expect(subject.return_planes).to match_array [plane2] 
    end
  end

end

