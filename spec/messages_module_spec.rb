describe Messages do

  let(:plane) { Plane.new { include ModuleToBeTested } }

  it "should test for a safety message about loading bays being full" do
    expect(plane.loading_bay_is_too_full_to_land_planes).to include("Safety hazard: The loading bay has too many planes to land")
  end

  it "should test for a safety message about the bad weather" do
    expect(plane.bad_weather_message).to include("Safety hazard: can't take off right now due to stormy weather")
  end

  it "should test for a plane landed message" do
    expect(plane.plane_landed_message).to include("plane has now landed at the airport\n")
  end

  it "should test for a plane_taken_off_message" do
    expect(plane.plane_taken_off_message).to include("The plane has now taken to the air\n")
  end

  it "should test for a plane_is_on_the_ground_message" do
    expect(plane.plane_is_on_the_ground_message).to include("The plane has already landed")
  end

  it "should test for a plane_is_in_the_air_already_message" do
    expect(plane.plane_is_in_the_air_already_message).to include("the plane is already flying")
  end

end
