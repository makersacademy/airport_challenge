require 'airport'
require 'plane'
require 'weather'

describe Airport do

  describe "#land_plan" do
    it 'Check if have a plane to land' do
      expect(subject).to respond_to :land
    end
  end

  describe "#take_off" do
    it 'Check if have a plane to take off' do
      expect(subject).to respond_to :take_off
    end
  end

  describe "Landing a plane" do

    it { is_expected.to respond_to(:land).with(1).argument }

    it "Should allow a plane to land" do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe "Taking off a plane" do
    it "Should allow a plane to take off" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end
  end

end
