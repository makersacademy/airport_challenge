
require 'airport'

describe Airport do
  let(:test_plane) { double(:plane, fly: nil, location: "Sky") }
  let(:landed_plane) { double(:plane, fly: nil, location: "testville") }
  let(:stormy_weather) { double(:weather, stormy?: true) }
  let(:sunny_weather) { double(:weather, stormy?: false) }
  test_cap = rand(100)
  let(:test_airport) { Airport.new("testville", test_cap, sunny_weather) }
  let(:stormy_airport) { Airport.new("testville", test_cap, stormy_weather) }

  it "has a default capacity" do
    expect(Airport.new("testville").capacity).to eq described_class::DEFAULT_CAPACITY
  end
  it "lets the default capacity be overridden" do
    expect(test_airport.capacity).to eq test_cap
  end

  describe '#take_off' do
    it 'removes the plane from the airport' do
      test_airport.take_off(landed_plane)
      expect(test_airport.send(:planes)).to eq []
    end

    it 'puts the plane in the sky' do
      test_airport.take_off(landed_plane)
      expect(test_plane.location).to eq "Sky"
    end

    it "doesn't take off a plane that isn't there" do
      expect { test_airport.take_off(test_plane) }.to raise_error("#{test_plane} not at #{test_airport.location}")
    end

  end
  describe '#add' do
    it 'adds the plane to the airport' do
      test_airport.add(test_plane)
      expect(test_airport.send(:planes)).to eq [test_plane]
    end
  end

  describe '#land' do
    it 'only lands planes that are in the sky' do
      expect { test_airport.land(landed_plane) }.to raise_error("#{landed_plane} currently at #{landed_plane.location}")
    end

    it "can't land a plane when the airport is full" do
      test_cap.times { test_airport.send(:planes) << test_plane }
      expect { test_airport.land(test_plane) }.to raise_error("#{test_airport.location} has no capacity")
    end

  end

  describe '#full' do
    it 'lets a plane know when the airport is full' do
      test_cap.times { test_airport.send(:planes) << test_plane }
      expect(test_airport.send(:full?)).to eq true

    end
  end

  context "Stormy weather" do
    it "doesn't let planes land" do
      expect { stormy_airport.land(test_plane) }.to raise_error("Landing aborted for #{test_plane} at #{stormy_airport.location}")
    end

    it "doesn't allow planes to take off" do
      expect { stormy_airport.take_off(test_plane) }.to raise_error("Take off aborted for #{test_plane} at #{stormy_airport.location}")
    end
  end

end
