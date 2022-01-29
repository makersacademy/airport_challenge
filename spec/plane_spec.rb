require "plane"

describe Plane do
  it "is a plane that can land" do
    expect(subject).to respond_to :land
  end
  it "is a plane that can take off" do
    expect(subject).to respond_to :take_off
  end
  describe "#land" do
    it "should land a plane at an airport" do
      expect(subject.land).to eq "Plane's landed!"
    end
  end
  describe "#take_off" do
    it "should lift a plane from an airport" do
      expect(subject.take_off).to eq "Plane took off and has left airport!"
    end
  end
end
