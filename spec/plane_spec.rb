require 'plane'

RSpec.describe Plane do
  it "should be able to take off" do
    expect(subject).to respond_to(:take_off)
  end

  it "should be able to land" do
    expect(subject).to respond_to(:land)
  end

  it "should report airborne status" do
    expect(subject).to respond_to(:airborne)
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
