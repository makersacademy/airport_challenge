require 'airport' 
require 'plane'

describe Airport do
  let(:plane) { double :plane }

  context "Airport Capacity:" do

    it "Has default capacity of 75 planes" do
      expect(subject.capacity).to eq 75
    end

    it "Cannot add planes if airport is full" do
      subject.capacity.times { subject.add_plane(plane) }
      expect { subject.add_plane(plane) }.to raise_error "Airport full"
    end

    it "Plane can land if airport not full" do
      capacity = subject.capacity - 1
      capacity.times { subject.add_plane(plane) } 
      expect { subject.add_plane(plane) }.to_not raise_error 
    end

    it "Airport capacity can be modified" do
      val = rand(1..100)
      subject.capacity = val
      expect(subject.capacity).to eq val
    end
  end
  
  context "Adding planes:" do
    before do
      subject.add_plane(plane)
    end

    it "Plane in airport once it lands" do
      expect(subject.planes.include?(plane)).to eq true
    end

    it "Confirms plane has landed" do
      expect(subject.confirm_landing(plane)).to eq "#{plane} has landed"
    end

    it "Returns error if plane has still not landed" do
      subject.remove_plane(plane)
      expect { subject.confirm_landing(plane) }.to raise_error "Plane has not landed"
    end
  end

  context "Removing planes:" do
    before do
      subject.add_plane(plane)
      subject.remove_plane(plane)
    end
    
    it "Plane removed from airport" do
      expect(subject.planes.include?(plane)).to eq false
    end

    it "Confirms plane is no longer at airport" do
      expect(subject.confirm_takeoff(plane)).to eq "#{plane} has taken off"
    end

    it "Returns error if plane has still not taken off" do
      subject.add_plane(plane)
      expect { subject.confirm_takeoff(plane) }.to raise_error "Plane has not taken off"
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
