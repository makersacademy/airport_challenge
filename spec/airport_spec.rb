require 'airport'
require 'plane'

RSpec::Matchers.define :all_be_grounded_planes do
  match do |actual|
    actual.all? { |planes| planes.airborne == false }
  end
end

RSpec.describe Airport do
  let(:test_plane) { Plane.new }
  let(:test_airport) { Airport.new }
  let(:clear_day) { double("weather", weather_report: :clear) }
  let(:stormy_day) { double("weather", weather_report: :stormy) }

  before(:each) do
    test_airport.weather = clear_day.weather_report
  end

  it "should harbour planes" do
    expect(subject.hangar).to all be_an_instance_of Plane
  end

  it "should not harbour things which aren't planes" do
    expect { test_airport.harbour_plane("Not a plane") }.to raise_error Errors::NOT_A_PLANE
  end

  it "should commission flights to a known airspace" do
    expect(subject.airspace).to be_an_instance_of Sky
  end

  context "#hangar" do
    it "should not contain airborne planes" do
      expect(subject.hangar).to all_be_grounded_planes
    end
  end

  context "hangar capacity" do
    it "should have a default value of 100" do
      expect(test_airport.capacity).to be Airport::DEFAULT_CAPACITY
    end

    it "should be able to be overwritten" do
      custom_airport = Airport.new(600)

      expect(custom_airport.capacity).to be 600
    end
  end

  context "in stormy weather" do
    it "should not allow planes to take off" do
      expect {
        test_airport.harbour_plane(test_plane)
        test_airport.weather = stormy_day.weather_report
        test_airport.commission_flight(test_plane)
      }.to raise_error Errors::STORMY_WEATHER_ON_TAKEOFF
    end

    it "should not allow planes to land" do
      expect {
        test_airport.harbour_plane(test_plane)
        test_airport.commission_flight(test_plane)
        test_airport.weather = stormy_day.weather_report
        test_airport.harbour_plane(test_plane)
      }.to raise_error Errors::STORMY_WEATHER_ON_LANDING
    end
  end

  context "when harbouring planes" do
    it "should deny landing if airport is full" do
      100.times { test_airport.harbour_plane(Plane.new) }

      expect { test_airport.harbour_plane(test_plane) }.to raise_error Errors::AT_CAPACITY
    end
  end

  context "after commissioning a flight" do
    let(:test_plane_2) { Plane.new }
    
    it "should not have the commissioned plane in the airport" do
      test_airport.harbour_plane(test_plane)
      test_airport.harbour_plane(test_plane_2)
      test_airport.commission_flight(test_plane)

      expect(test_airport.hangar).not_to include(test_plane)
    end

    it "should not be able to commission the same plane while airborne" do
      test_airport.harbour_plane(test_plane)
      test_airport.commission_flight(test_plane)

      expect { test_airport.commission_flight(test_plane) }.to raise_error Errors::NOT_AT_AIRPORT
    end
  end
end
