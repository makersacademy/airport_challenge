require 'airport'
require 'plane'

describe Airport do

  describe '::new' do
    it {should be_instance_of(Airport)}
  end

  describe 'land' do
    it {should respond_to(:land).with (1)}
    it 'instructs plane to land' do
      expect(subject.land(Plane.new))
    end
  end

  describe 'takeoff' do
    it {should respond_to(:takeoff).with (1)}
    it 'instructs plane to takeoff' do
      expect(subject.takeoff(Plane.new))
    end
  end
end