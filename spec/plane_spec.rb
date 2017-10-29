require 'plane'
require 'airport'

describe Plane do
  subject(:test_plane) { described_class.new }
  let(:airport) { Airport.new }

  describe 'plane' do
    it 'should create a new plane' do
      expect(test_plane).to be_instance_of(Plane)
    end
  end

  describe 'land' do
    it "should raise error if plane tries to land when stormy" do
      message = 'the plane cannot land due to the storm'
      expect { test_plane.land(airport, true) }.to raise_error(message)
    end

    it "should land & status eq 'grounded' when not stormy" do
      test_plane.takeoff(false)
      test_plane.land(airport, false)
      expect(test_plane.status).to eq(:grounded)
    end

    it 'should add one plane to the airport capacity' do
      test_plane.takeoff(false)
      test_plane.land(airport, false)
      expect(airport.number_of_planes).to eq(1)
    end

    it 'should raise error when at max_capacity' do
      20.times {
        test_plane.takeoff(false)
        test_plane.land(airport, false)
      }
      message = 'airport at max capacity'
      expect { test_plane.land(airport, false) }.to raise_error(message)
    end

    it 'should raise error if plane is already grounded' do
      message = 'plane already grounded'
      expect { test_plane.land(airport, false) }.to raise_error(message)
    end

  end

  describe 'takeoff' do
    it 'should raise error if stormy' do
      message = 'the plane is grounded by the storm'
      expect { test_plane.takeoff(true) }.to raise_error(message)
    end

    it "should takeoff & status eq 'airbourne' when not stormy" do
      test_plane.takeoff(false)
      expect(test_plane.status).to eq(:airbourne)
    end

    it 'should raise error if plane is already airbourne' do
      test_plane.takeoff(false)
      message = 'plane already airbourne'
      expect { test_plane.takeoff(false) }.to raise_error(message)
    end
  end

  describe 'stormy?' do
    it 'should return true or false' do
      expect(test_plane.stormy?).to be(true).or be(false)
    end
  end

  describe 'max_capacity?' do
    it 'should return true or false' do
      expect(test_plane.max_capacity?(airport)).to be(true).or be(false)
    end
    it 'should return false if under capacity' do
      expect(test_plane.max_capacity?(airport)).to be(false)
    end
    it 'should return true if at max capacity' do
      20.times {
        test_plane.takeoff(false)
        test_plane.land(airport, false)
      }
      expect(test_plane.max_capacity?(airport)).to be(true)
    end
  end

  describe 'capacity_add' do
    let(:plane) { Plane.new }

    it 'should add 1 to the airports number of planes' do
      plane.capacity_add(airport)
      expect(airport.number_of_planes).to eq(1)
    end
  end

end
