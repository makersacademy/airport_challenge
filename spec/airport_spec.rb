require 'airport' 
require 'plane'

describe Airport do
  let(:plane) {double :plane}

  context "Airport Capacity:" do

    it "Has default capacity of 75 planes" do
      expect(subject.capacity).to eq 75
    end

    it "Cannot add planes if airport is full" do
      subject.capacity.times { subject.add_plane(plane) }
      expect { subject.add_plane(plane) }.to raise_error "Airport full"
    end

    it "Plane can land if airport not full" do
      subject.capacity - 1.times { subject.add_plane(plane)  } 
      expect { subject.add_plane(plane)  }.to_not raise_error 
    end

    it "Airport capacity can be modified" do
      val = rand(1..100)
      subject.capacity = val
      expect(subject.capacity).to eq val
    end
  end
  
  context "Adding planes:" do
    it "Plane in airport once it lands" do
      subject.add_plane(plane)
      expect(subject.planes.include?(plane)).to eq true
    end
  end

  context "Removing planes:" do
    it "Plane removed from airport after takeoff" do
      subject.remove_plane(plane)
      expect(subject.planes.include?(plane)).to eq false
    end

    it "Confirms plane is no longer at airport" do
      expect(subject.remove_plane(plane)).to eq "#{plane} has left"
    end
  end

  context "Check if plane in airport:" do
    it "Returns true if plane in airport" do
      subject.add_plane(plane)
      expect(subject.plane_at_airport?(plane)).to eq true
    end

    it "Returns false if plane not in airport" do
      expect(subject.plane_at_airport?(plane)).to eq false
    end
  end

end