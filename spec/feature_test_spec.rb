require 'weather'

describe "Airport Feature Test" do
  # setup scenario
  let(:heathrow) { Airport.new }
  let(:jfk) { Airport.new }
  let(:lax) { Airport.new }
  let(:plane1) { Plane.new(heathrow) }
  let(:plane2) { Plane.new(heathrow) }
  let(:plane3) { Plane.new(jfk) }
  let(:plane4) { Plane.new(jfk) }
  let(:plane5) { Plane.new(lax) }
  let(:plane6) { Plane.new(lax) }
  # set weather to sunny
  before(:each) { allow_any_instance_of(Weather).to receive(:weather).and_return("sunny") }

  it "sees plane 1 as flying" do
    heathrow.release_plane(plane1)
    expect(plane1.location).to eq("flying")
  end

  it "sees plane 2 as flying" do
    heathrow.release_plane(plane2)
    expect(plane2.location).to eq("flying")
  end

  it "sees heathrow is empty" do
    heathrow.release_plane(plane1)
    heathrow.release_plane(plane2)
    expect(heathrow.planes.empty?).to eq(true)
  end

  it "returns the correct location for a plane after a series of flights" do
    lax.release_plane(plane5)
    jfk.receive_plane(plane5)
    jfk.release_plane(plane5)
    heathrow.receive_plane(plane5)
    expect(plane5.location).to eq(heathrow)
  end

  it "doesn't allow a plane to take off from the wrong airport" do
    heathrow.release_plane(plane3)
    expect(plane3.location).to eq(jfk)
  end

  it "doesn't allow a landed plane to land" do
    heathrow.receive_plane(plane3)
    expect(plane3.location).to eq(jfk)
  end
end
