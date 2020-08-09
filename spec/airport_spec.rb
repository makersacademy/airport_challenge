require 'airport'

describe Airport do

  it "airport exists" do
    airport = Airport.new
    expect(airport).to be_an_instance_of(Airport)
  end

  describe "#land" do
    it { is_expected.to respond_to(:land).with(1).argument }

    it "lands a plane" do
      plane = Plane.new
      expect(subject.land(plane)).to eq(plane)
    end
  end

  it { is_expected.to respond_to(:take_off) }

end
