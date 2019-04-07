require 'airport'

describe Airport do
  context "when no planes are available" do
    it "returns an empty hanger array" do
      expect(subject.hanger).to eq []
    end
  end
  context "when sunny and planes are available" do
    it "take_off releases the correct plane from the hanger" do
      plane = Plane.new
      plane2 = Plane.new
      forecast = "sunny"
      plane.land_at(subject, forecast)
      plane2.land_at(subject, forecast)
      subject.take_off(plane, forecast)
      expect(subject.hanger).to eq [plane2]
    end
  end
end
