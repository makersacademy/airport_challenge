require "airport"

describe Airport do

  context "testing takeoff method" do

    it "raises an error when airport is empty" do
      expect { subject.takeoff }.to raise_error "Airport is empty"
    end

    it "makes a plane take off" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.takeoff).to eq plane
    end

  end

  context "testing land method" do

    it "raises an error when airport is full" do
      #20.times { subject.land(Plane.new) }
      subject.land(Plane.new)
      subject.land(Plane.new)
      expect { subject.land(Plane.new) }.to raise_error "airport full"
    end

    it "lands a plane and returns landed plane" do
      landed_plane = Plane.new
      expect(subject.land(landed_plane)).to eq [landed_plane]
    end

    it "returns the plane that just landed" do
      landed_plane = Plane.new
      expect(subject.land(landed_plane)).to eq ([landed_plane])

    end

  end

end
