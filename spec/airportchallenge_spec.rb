require "airport_challenge.rb"

describe AirportCondition do

  it "stores the planes" do

  end

  it "tells the weather" do
  end

end

describe AirTrafficControl do

  it "tells weather is bad so no landing" do
	 t = AirTrafficControl.new
  expect(t.land_plane).to eq(p "The weather is stormy! You can\'t land the plane!").or eq($weather = stormy)
  end

  it "tells hangar is full" do
     t = AirTrafficControl.new
  expect(t.land_plane).to eq(p "The hangar is full. You can\'t land the plane!").or eq($hangar.count == 10)
  end

  it "lands plane" do
     t = AirTrafficControl.new
  expect(t.land_plane).to eq(p "The airplain landed succesfully. There are " + $hangar.count.to_s + " plains in the hangar.").or eq($weather = "sunny")
  end

  it "tells weather is bad so no takeoff" do
     t = AirTrafficControl.new
  expect(t.takeoff_plane).to eq(p "The weather is stormy! You can\'t take off!").or eq($weather = "stormy")
  end

  it "tells hanger is empty" do
  	 t = AirTrafficControl.new
  expect(t.takeoff_plane).to eq(p "All the planes are flying!").or eq($hangar.count == 0)
  end
  it "airplain took off" do
  	 t = AirTrafficControl.new
  expect(t.takeoff_plane).to eq(p "The airplane left the hangar and took off succesfully!").or eq($weather = "sunny")
  end
end
