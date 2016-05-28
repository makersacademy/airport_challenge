require 'airport'
require 'plane'

describe Airport do
  describe '::new' do
    it {should be_instance_of(Airport)}
  end
  
  describe 'initialize airport at set capacity' do
    it 'accepts an argument when created' do
      expect Airport.new(40)
    end
    it 'sets default capacity if no argument is given' do
      airport = Airport.new
      50.times{airport.land(Plane.new)}
      expect {airport.land(Plane.new)}.to raise_error("Airport full")
    end
  end

  

  describe 'land' do
    it {should respond_to(:land).with (1)}
    it 'instructs plane to land' do
      expect(subject.land(Plane.new))
    end
    it 'raises an error if airport is full' do
      50.times{subject.land(Plane.new)}
      expect {subject.land(Plane.new)}.to raise_error("Airport full")
    end
  end

  describe 'takeoff' do
    it {should respond_to(:takeoff)}
    it 'instructs plane to takeoff' do
      subject.land(Plane.new)
      expect{(subject.takeoff)}
    end
    it 'raises an error if airport is empty' do
      expect {subject.takeoff}.to raise_error("Airport empty")
    end
  end
end