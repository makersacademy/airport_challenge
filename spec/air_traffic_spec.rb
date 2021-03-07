require 'air_traffic'
require 'airport'
require 'plane'

describe AirTraffic do
  controller = AirTraffic.new
  test_airport = Airport.new
  test_plane = Plane.new(test_airport, test_airport)

  it "asks a plane its location and expect an answer" do
    expect(subject.interrogate(test_plane)).to be_a(String).or be_a(Airport)
  end

  it "sends a message to land with clear conditions" do
    allow(test_airport).to receive(:rand).and_return(1)
    expect(subject.land(test_plane, test_airport)).to eq(false)
  end

  it "sends a message to takeoff with clear conditions" do
    allow(test_airport).to receive(:rand).and_return(1)
    expect(subject.takeoff(test_plane, test_airport)).to eq(true)
  end

  describe 'airports the collection' do
    it "must be an Array" do
      expect(subject.airports).to be_a(Array)
    end
    controller.airports.each do |airport|
      it "must contain objects of class Aiport" do
        expect(airport).to be_a(Airport)
      end
    end
  end

  describe 'planes the collection' do
    it "must be an Array" do
      expect(subject.planes).to be_a(Array)
    end
    controller.planes.each do |plane|
      it "must be contain objects of class Plane" do
        expect(plane).to be_a(Plane)
      end
    end
  end
end
