require 'plane'
require 'airport'

describe "feature" do

  let(:airport1) { Airport.new() }
  let(:airport2) { Airport.new() }
  let(:airport3) { Airport.new() }
  let(:plane1) { Plane.new() }
  let(:plane2) { Plane.new() }
  let(:plane3) { Plane.new() }
  let(:plane4) { Plane.new() }
  let(:plane5) { Plane.new() }

  it "Five planes can be landed and then taken off from two seperate airports and then all landed at a third" do
    srand(2)

    plane1.land(airport1)
    plane2.land(airport1)
    plane3.land(airport2)
    plane4.land(airport2)
    plane5.land(airport2)

    plane1.take_off(airport1)
    plane2.take_off(airport1)
    plane3.take_off(airport2)
    plane4.take_off(airport2)
    plane5.take_off(airport2)

    plane1.land(airport3)
    plane2.land(airport3)
    plane3.land(airport3)
    plane4.land(airport3)
    plane5.land(airport3)

    expect(airport1.planes_in_hangar.length).to eq(0)
    expect(airport2.planes_in_hangar.length).to eq(0)
    expect(airport3.planes_in_hangar.length).to eq(5)

    expect(plane1.landed_at).to be(airport3)
    expect(plane2.landed_at).to be(airport3)
    expect(plane3.landed_at).to be(airport3)
    expect(plane4.landed_at).to be(airport3)
    expect(plane5.landed_at).to be(airport3)
  end

end
