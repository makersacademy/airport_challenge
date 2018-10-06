require 'pry'
require 'airport.rb'
require 'plane'

test_cap = rand(100)
test_airport = Airport.new("testville", test_cap)
test_plane = Plane.new("testville_factory")
test_plane.fly

describe Airport do

  it "has a default capacity" do
    expect(Airport.new("testville").capacity).to eq described_class::DEFAULT_CAPACITY
  end
  it "lets the default capacity be overridden" do
    expect(test_airport.capacity).to eq test_cap
  end

  describe '#take_off' do
    it 'removes the plane from the airport' do
      test_airport.land(test_plane)
      test_airport.take_off(test_plane)
      expect(test_airport.planes).to eq []
    end

    it 'puts the plane in the sky' do
      test_airport.land(test_plane)
      test_airport.take_off(test_plane)
      expect(test_plane.location).to eq "Sky"
    end

    it "doesn't take off a plane that isn't there" do
      expect(test_airport.take_off(test_plane)).to be_nil
    end

  end

  describe '#land' do
    it 'adds the plane to the airport' do
      test_airport.land(test_plane)
      expect(test_airport.planes).to eq [test_plane]
    end

    it 'only lands planes that are in the sky' do
      expect(test_airport.land(test_plane)).to be_nil
    end

  end

  describe '#full' do
    it 'lets a plane know when the airport is full' do
      test_cap.times { test_airport.planes << test_plane }
      expect(test_airport).to be_full

    end
  end

end
