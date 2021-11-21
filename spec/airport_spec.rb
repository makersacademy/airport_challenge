require 'airport' 
require 'plane'

describe Airport do
  before do
    @plane = Plane.new
  end

  context "Airport Capacity: " do

    it "Has default capacity of 75 planes" do
      expect(subject.capacity).to eq 75
    end

    it "plane cannot land if airport is full" do
      subject.capacity.times { @plane.land(subject) }
      expect { @plane.land(subject) }.to raise_error "Airport full"
    end

    it "plane can land if airport not full" do
      subject.capacity - 1.times { @plane.land(subject) } 
      expect { @plane.land(subject) }.to_not raise_error 
    end

    it "airport capacity can be modified" do
      val = rand(1..100)
      subject.capacity = val
      expect(subject.capacity).to eq val

    end
  end
  
  it "Plane in airport once it lands" do
    @plane.land(subject)
    expect(subject.planes.include?(@plane)).to eq true
  end

  context "Removing planes: " do
    it "Plane removed from airport after takeoff" do
      @plane.takeoff(subject)
      expect(subject.planes.include?(@plane)).to eq false
    end

    it "Confirms plane is no longer at airport" do
      expect(subject.remove_plane(@plane)).to eq "#{@plane} has left"
    end
  end

end