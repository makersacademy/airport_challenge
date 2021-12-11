require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to :instruct_landing }
  it { is_expected.to respond_to :instruct_take_off }

  describe "#instruct_landing" do
    it "can instruct a plane to land" do
      expect(subject.instruct_landing(Plane.new)).to eq(subject.plane)
    end

    it "raises an error if the airport is full" do
      subject.instruct_landing(Plane.new)
      expect { subject.instruct_landing(Plane.new) }.to raise_error "CANNOT LAND: AIRPORT AT FULL CAPACITY!"
    end
  end

  describe "#instruct_take_off" do
    it "can instruct a plane to take_off" do
      subject.instruct_landing(Plane.new)
      expect(subject.instruct_take_off).to eq(subject.plane)
    end
  end
end
