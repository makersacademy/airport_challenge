require 'airport'
require 'planes'

describe Airport do
  let(:plane) { Plane.new }
  describe "instruct_to_land" do
    it { is_expected.to respond_to(:instruct_to_land).with(1).argument }
    it "prevents landing if airport is full" do
      allow(plane).to receive(:instruct_to_land).and_return(false)
      Airport::DEFAULT_CAPACITY.times { subject.instruct_to_land(plane) }
      expect { subject.instruct_to_land Plane.new }.to raise_error "CANNOT LAND, AIRPORT AT CAPACITY"
    end
  end
  describe "instruct_to_take_off" do
    it { is_expected.to respond_to(:instruct_to_take_off).with(2).argument }
  end
end
