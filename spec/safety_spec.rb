require 'safety'
describe Safety do

  before do
    allow_any_instance_of(Weather).to receive(:status) { "sunny" }
  end

  it "expects airport capacity check to return 'negative'" do
    airport1 = Airport.new("Test_port")
    plane1 = Plane.new("Dummy_plane_1")
    plane2 = Plane.new("Dummy_plane_2")
    plane3 = Plane.new("Dummy_plane_3")
    plane4 = Plane.new("Dummy_plane_4")
    plane5 = Plane.new("Dummy_plane_5")
    plane1.land(airport1)
    plane2.land(airport1)
    plane3.land(airport1)
    plane4.land(airport1)
    plane5.land(airport1)
    expect(airport1.airport_capacity_check(airport1) == "negative").to eq true
  end

  it "expects airport ro be full" do
    airport1 = Airport.new("Test_port")
    plane1 = Plane.new("Dummy_plane_1")
    plane2 = Plane.new("Dummy_plane_2")
    plane3 = Plane.new("Dummy_plane_3")
    plane4 = Plane.new("Dummy_plane_4")
    plane5 = Plane.new("Dummy_plane_5")
    plane6 = Plane.new("Test_plane")
    plane1.land(airport1)
    plane2.land(airport1)
    plane3.land(airport1)
    plane4.land(airport1)
    plane5.land(airport1)
    expect(plane6.landing_safety_check(airport1, plane6) == "Landing aborted: Test_port full").to eq true
  end

end
