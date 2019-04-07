require 'airport'

describe Airport do
  it "empties the hanger" do
    plane = Plane.new
    forecast = "sunny"
    plane.land_at(subject)
    subject.take_off(plane, forecast)
    expect(subject.hanger).to eq []
  end
  it "releases the correct plane from the hanger" do
    plane = Plane.new
    plane2 = Plane.new
    forecast = "sunny"
    plane.land_at(subject)
    plane2.land_at(subject)
    subject.take_off(plane, forecast)
    expect(subject.hanger).to eq [plane2]
  end
end
