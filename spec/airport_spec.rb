require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  describe "#land" do
    it "allows a plane to land" do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end
  end

  # it "returns landed planes" do
  #   plane = Plane.new
  #   subject.land(plane)
  #   expect(subject.plane).to eq plane
  # end

  describe "#take_off" do
    it "allows a plane to take-off" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end
  end

end
