require 'airport'

describe Airport do
  let(:plane) { double(:my_plane, landing: true, taking_off: true) }

  describe "#land" do

    it "should land a plane" do
      subject.land(plane)
      expect(subject.planes.include?(plane)).to be true
    end

    it "should not land a plane if the weather is stormy" do
      subject.stormy = true
      expect { subject.land(plane) }.to raise_error "Currently unsafe to land plane"
    end

    it "should not land a plane is the airport is full" do
      30.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "Airport currently full"
    end

  end

  describe "#takeoff" do

    it "should make a plane take off" do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes.include?(plane)).to be false
    end

    it "should not let a plane take off if the weather is stormy" do
      subject.land(plane)
      subject.stormy = true
      expect { subject.takeoff(plane) }.to raise_error "Currently unsafe for plane to take off"
    end

  end
end
