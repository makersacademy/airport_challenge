require_relative '../lib/airport'

describe Airport do
  context "landing planes" do
    it {is_expected.to respond_to(:land).with(1).argument}

    it "plane is in the airport once it has landed" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

  context "planes taking off" do
    it {is_expected.to respond_to(:take_off)}

    it "plane is no longer in the airport after take off" do
      plane = Plane.new
      subject.land(plane)
      subject.take_off
      expect(subject.planes).not_to include(plane)
    end
  end
end