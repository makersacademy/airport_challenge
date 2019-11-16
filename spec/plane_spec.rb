require 'plane'

RSpec.describe Plane do
  let(:test_plane) { Plane.new }

  it "should be able to take off" do
    expect(subject).to respond_to(:take_off)
  end

  it "should be able to land" do
    expect(subject).to respond_to(:land)
  end
  
  context "airbrone status" do
    it "should be airborne after takeoff" do
      test_plane.take_off
      expect(test_plane.airborne).to be true
    end

    it "should not be airborne after landing" do
      test_plane.take_off
      test_plane.land
      expect(test_plane.airborne).to be false
    end
  end

  context "when airbourne" do
    it "should not be able to take off" do
      plane = Plane.new
      plane.take_off

      expect { plane.take_off }.to raise_error Errors::CURRENTLY_AIRBORNE
    end
  end

  context "when grounded" do
    it "should not be able to land" do
      expect { subject.land }.to raise_error Errors::CURRENTLY_GROUNDED
    end
  end
end
