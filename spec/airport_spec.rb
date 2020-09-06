require 'airport'
require 'plane'

plane = Plane.new

describe Airport do
    context "planes landing"
    it { is_expected.to respond_to(:land).with(1).argument }
    
    it "raises an error if landing a plane when airport is full" do
    subject.land(Plane.new)
    expect { subject.land(Plane.new) }.to raise_error("Cannot land anymore plane, airport is full.")
    end

    context "planes taking off"
      it { is_expected.to respond_to(:land).with(1).argument }
    
      it "returns the plane taking off" do
      expect(subject.take_off(plane)).to eq(plane) 
      end
end