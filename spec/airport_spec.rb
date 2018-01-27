require 'airport'

describe Airport do

  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }
    it "allow planes to land" do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe "#take_off" do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it "allow to planes to take off" do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq plane
    end
  end

  describe "landed_planes" do
    it "returns landed planes" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.landed_planes).to eq [plane]
    end
  end

  describe "initialization" do
    it "should have a capacity to keep the landed planes " do
      plane = Plane.new
      expect { 10.times { subject.land plane } }.to_not raise_error
    end
  end
end
