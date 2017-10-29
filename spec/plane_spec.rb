require 'plane'

describe Plane do

  describe 'plane' do
    let(:test_plane) { Plane.new }
    it 'should create a new plane' do
      expect(test_plane).to be_instance_of(Plane)
    end
  end

  describe 'land' do
    let(:test_plane) { Plane.new }
    it 'should send allow the plane to land' do
      expect(test_plane).to respond_to(:land)
    end

    it 'should send allow the plane to land at an Airport' do
      expect(test_plane).to respond_to(:land).with(1).argument
    end
  end

  describe 'takeoff' do
    let(:test_plane) { Plane.new }
    it 'should instruct the plane to takeoff' do
      expect(test_plane).to respond_to(:takeoff)
    end

    it 'should set the plane\'s status as airborne' do
      test_plane.takeoff
      expect(test_plane.status).to eq('airbourne')
    end
  end

  describe 'status' do
    let(:test_plane) { Plane.new }
    it 'should be able to have a status set' do
      expect(test_plane).to respond_to(:status)
    end
  end
end
