require 'plane'
require 'airport'

describe Plane do

  describe 'plane' do
    let(:test_plane) { Plane.new }
    it 'should create a new plane' do
      expect(test_plane).to be_instance_of(Plane)
    end
  end

  describe 'land' do
    let(:test_plane) { Plane.new }
    let(:airport) { Airport.new }
    it 'should allow the plane to land' do
      expect(test_plane).to respond_to(:land)
    end

    it 'should allow the plane to land at an Airport' do
      expect(test_plane).to respond_to(:land).with(1).argument
    end

    it "should raise error if plane tries to land when stormy" do
      airport = Airport.new
      expect { test_plane.land(airport,true) }.to raise_error('the plane cannot land due to the storm')
    end

    it "should land & status eq 'grounded' when not stormy" do
      airport = Airport.new
      test_plane.land(airport,false)
      expect(test_plane.status).to eq('grounded')
    end

    it 'should add one plane to the airport capacity' do
      test_plane.land(airport, false)
      expect(airport.number_of_planes).to eq(1)
    end

    it 'should raise error when at max_capacity' do
      20.times { test_plane.land(airport, false) }
      expect{ test_plane.land(airport, false) }.to raise_error('airport at max capacity')
    end

  end

  describe 'takeoff' do
    let(:test_plane) { Plane.new }
    it 'should instruct the plane to takeoff' do
      expect(test_plane).to respond_to(:takeoff)
    end

    it 'should raise error if stormy' do
      expect { test_plane.takeoff(true) }.to raise_error("the plane is grounded by the storm")# if test_plane.stormy?
    end

    it "should takeoff & status eq 'airbourne' when not stormy" do
      airport = Airport.new
      test_plane.takeoff(false)
      expect(test_plane.status).to eq('airbourne')
    end
  end

  describe 'status' do
    let(:test_plane) { Plane.new }
    it "should report it's status" do
      expect(test_plane).to respond_to(:status)
    end
  end

  describe 'stormy?' do
    let(:test_plane) { Plane.new }
    it 'should return true or false' do
      expect(test_plane.stormy?).to be(true).or be(false)
    end
  end

  describe 'max_capacity?' do
    let(:test_plane) { Plane.new }
    let(:airport) { Airport.new }
    it 'should return true or false' do
      expect(test_plane.max_capacity?(airport)).to be(true).or be(false)
    end
    it 'should return false if under capacity' do
      expect(test_plane.max_capacity?(airport)).to be(false)
    end
    it 'should return true if at max capacity' do
      20.times { test_plane.land(airport, false) }
      expect(test_plane.max_capacity?(airport)).to be(true)
    end
  end

  describe 'capacity_add' do
    it 'should add 1 to the airports number of planes' do
      plane = Plane.new
      airport = Airport.new
      plane.capacity_add(airport)
      expect(airport.number_of_planes).to eq(1)
    end
  end

end
