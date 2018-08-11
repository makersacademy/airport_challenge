require 'airport'

describe Airport do

  describe "@hangar - data structure to hold planes" do
    it "@hangar - will store planes in an array - initialized empty" do
      expect(subject.hangar).to eq([])
    end
  end


  describe "#land_plane" do
    it ".land_plane - Airport responds to method" do
      expect(subject).to respond_to(:land_plane).with(1).argument
    end
    it ".land_plane - returns a Plane object in an array" do
      plane = Plane.new # here we need to think about mocking
      expect(subject.land_plane(Plane)).to eq([Plane])
    end
    it ".land_plane - gives error if there is already a plane in hangar" do
      plane = Plane.new
      expect { 2.times{ subject.land_plane(plane) }  } .to raise_error("Hangar Full!!!")
    end

  end


  describe "#take_off" do
    it ".take_off - Airport responds to this method" do
      expect(subject).to respond_to(:take_off)
    end
  end









end
