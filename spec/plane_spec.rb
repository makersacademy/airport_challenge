require "plane"

shared_context "common plane" do
  let(:plane) { Plane.new({airline: "Qatar Airways", flight_number: "QA101", next_takeoff_destination: "Tokyo"}) }
end

describe Plane do
  include_context "common plane"

  context "has attributes" do
    it "airline, flight_number and next_takeoff_destination" do
      
      expect(plane).to have_attributes(airline: "Qatar Airways", flight_number: "QA101", next_takeoff_destination: "Tokyo")
    end
  end

  context "responds to method" do
    it "#flight_details" do
      expect(plane).to respond_to(:flight_details)
    end
  end
  
  context "method functionality -" do
    it "returns hash of flight details" do
      expect(plane.flight_details).to eq({airline: "Qatar Airways", flight_number: "QA101", next_takeoff_destination: "Tokyo"})
    end
  end
end