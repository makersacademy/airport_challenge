require 'airport'

describe Airport do
  describe "landing plane tests" do
    it { is_expected.to respond_to(:land).with(1).argument }

    it "returns the landed plane" do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end

  describe "taking-off plane tests" do
    it { is_expected.to respond_to(:take_off) }
  end

  it "returns the take-off plane" do
    plane = Plane.new
    subject.land(plane)                            
    expect(subject.take_off).to eq plane
  end

end
