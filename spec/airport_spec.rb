require 'airport'
require 'plane'

plane = Plane.new

describe Airport do
    context "planes landing"
    it { is_expected.to respond_to(:land).with(1).argument }
    
    context "planes taking off"
      it { is_expected.to respond_to :take_off }
    
      it "returns the plane taking off" do
      expect(subject.take_off(plane)).to eq(plane) 
      end
end