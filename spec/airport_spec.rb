require "airport"

describe Airport do

  describe "#landing" do
    it 'It allows planes to land' do
      plane = Plane.new
      expect(subject.landing_plane(plane)).to eq [plane]
    end
  end
# planes land - test to see if they can then take off
  describe "#take_off" do
    it "It allows planes to take off" do
      plane = Plane.new
      subject.landing_plane(plane)
      expect(subject.take_off).to eq plane
    end
  end

end
