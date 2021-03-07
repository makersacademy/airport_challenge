require 'air_traffic'
require 'airport'
require 'plane'

describe AirTraffic do
  test_airport = Airport.new
  test_plane = Plane.new(test_airport, test_airport)

  it "asks a plane its location and expect an answer" do
    expect(subject.interrogate(test_plane)).to be_a(String).or be_a(Airport)
  end

  it "sends a message to land with clear conditions" do
    allow(test_airport).to receive(:rand).and_return(1)
    test_plane.takeoff(test_airport)
    allow(test_airport).to receive(:rand).and_return(1)
    expect(subject.land(test_plane, test_airport)).to eq(false)
  end

  it "sends a message to takeoff with clear conditions" do
    allow(test_airport).to receive(:rand).and_return(1)
    expect(subject.takeoff(test_plane, test_airport)).to eq(true)
  end
end
