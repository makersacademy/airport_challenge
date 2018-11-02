require "airport"

describe Airport do
  let(:plane) { double }
  let(:rejected_plane) { double }
  let(:landed_plane) { double }
  let(:bad_weather) { double(:report => "stormy") }
  let(:good_weather) { double(:report => "good") }
  #user story 1
  it { expect(subject).to respond_to(:receive_plane).with(1).argument }
  it "Once landed the plane appears in the aiport @landed_planes" do
    good_weather_airport = Airport.new(20, good_weather)
    good_weather_airport.receive_plane(plane)
    expect(good_weather_airport.landed_planes).to include(plane)
  end

  #user story 2: plane can take take take off
  it "When we release the plane (when weather is good), the plane is removed from the landed_planes array" do
    good_weather_airport = Airport.new(20, good_weather)
    good_weather_airport.receive_plane(plane)
    expect(good_weather_airport.release_plane(plane)).to eq(true)
    expect(good_weather_airport.landed_planes).not_to include(plane)
  end

  #user story 3: plane can't take off in bad weather
  it "release plane returns false if the weather is stormy" do
    bad_weather_airport = Airport.new(20, bad_weather, plane)
    expect(bad_weather_airport.release_plane(plane)).to eq(false)
  end


  it { expect(Airport::DEFAULT_CAPACITY).to eq(20) }
  it "can change the capacity when initialising airport" do
    airport_test = Airport.new(50)
    expect(airport_test.capacity).to eq(50)
  end

  it "prevents landing any more planes when airport has reached capacity" do
    small_airport = Airport.new(1)
    small_airport.receive_plane(plane)
    small_airport.receive_plane(rejected_plane)
    expect(small_airport.landed_planes).not_to include(rejected_plane)
  end

  it "if the weather is bad the plane cannot take off" do
    bad_weather_airport = Airport.new(20, bad_weather)
    bad_weather_airport.receive_plane(landed_plane)
    expect(bad_weather_airport.release_plane(landed_plane)).to eq(false)
  end

  #US5 setting default and changing default capacity
  it "Capacity default works but can also be changed on initialisation" do
    expect(Airport.new(10).capacity).to eq(10)
    expect(Airport.new.capacity).to eq(20)
  end
end
