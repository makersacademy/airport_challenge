require 'airport'
require 'weather'
require 'plane'

describe Airport do 

    it ' hould have a default capacity of 50' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'should respond to landing' do
      plane = Plane.new
      expect(subject).to respond_to(:land)
    end

    it 'should respond to takeoff' do
      expect(subject).to respond_to(:take_off)
    end

    it 'should not land when stormy' do
      plane = Plane.new
      expect(subject.land(plane)).and_return("stormy").to raise_error 'Dangerous Weather'
    end





  

end