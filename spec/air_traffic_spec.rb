require 'air_traffic'
require 'airport'
require 'plane'

describe AirTraffic do
  controller = AirTraffic.new
  
  it "sends a message to land" do
    expect(subject.instruction).to eq("land")
  end

  describe 'planes' do
    it "must be an Array" do
      expect(subject.planes).to be_a(Array)
    end
    controller.planes.each do |plane|
      it "must be contain objects of class Plane" do
        expect(plane).to be_a(Plane)
      end
    end
  end
  
  describe 'airports' do
    it "must be an Array" do
      expect(subject.airports).to be_a(Array)
    end
    controller.airports.each do |airport|
      it "must contain objects of class Aiport" do
        expect(airport).to be_a(Airport)
      end
    end
  end
end
