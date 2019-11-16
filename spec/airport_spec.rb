require 'airport'
require 'plane'

RSpec.describe Airport do
  let(:test_plane) { Plane.new }

  it "should harbour planes" do
    expect(subject).to respond_to(:harbour_plane).with(1).arguments
  end

  it "should commission flights" do
    expect(subject).to respond_to(:commission_flight).with(1).arguments
    expect(subject.commission_flight(test_plane)).to be test_plane
  end
  
  it "should have a maximum capacity" do
    expect(subject).to respond_to(:capacity)
  end

  context "when harbouring planes" do
    it "should deny landing if airport is full" do
      test_airport = Airport.new
      100.times { test_airport.harbour_plane(test_plane) }

      expect { test_airport.harbour_plane(test_plane) }.to raise_error Errors::AT_CAPACITY
    end
  end
end
