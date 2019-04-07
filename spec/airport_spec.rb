require 'airport'

describe Airport do
  it "returns airport capacity" do
    expect(subject.capacity).to eq 2
  end

  context "when no planes are available" do
    it "returns an empty hangar array" do
      expect(subject.hangar).to eq []
    end
  end

  context "when sunny and planes are available" do
    let(:plane) { Plane.new }
    let(:plane2) { Plane.new }
    let(:forecast) { "sunny" }

    it "takeoff releases the correct plane from the hanger" do
      plane.land_at(subject, forecast)
      plane2.land_at(subject, forecast)
      subject.takeoff(plane, forecast)
      expect(subject.hangar).to eq [plane2]
    end
  end

  context "when the weather is stormy" do
    let(:plane) { Plane.new }
    let(:forecast) { "stormy" }

    it "take_off is prevented" do
      expect(subject.takeoff(plane, forecast)).to eq "Takeoff prevented due to stormy weather"
    end
  end
end
