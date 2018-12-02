require "airport"
require "weather"

describe Airport do

  describe "#landing" do
    it 'It allows planes to land' do
      plane = Plane.new
      # Will land when weather isn't stormy - 60% of the time
      @weather = allow(subject).to receive(:weather) { false }
      expect(subject.landing_plane(plane)).to eq [plane]
    end
  end

  describe "#take_off" do
    it "It allows planes to take off" do
      plane = Plane.new
      # bad weather prevents planes taking off
      allow(subject).to receive(:weather) { false }
      subject.landing_plane(plane)
      expect(subject.take_off).to eq plane
    end
  end

end
