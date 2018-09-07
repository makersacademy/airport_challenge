require 'airport'
require 'plane'
require 'weather'

describe Airport do
  describe '#land' do
    it 'instruct a plane to land' do
      plane = Plane.new
      subject.land(plane)
      expect(subject).to respond_to(:land).with(1).argument

    end
  end

  describe '#take_off' do
    it 'instruct a plane to take off' do
      plane = Plane.new
      subject.take_off(plane)
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    # it 'clears the plane which take off from airport' do
    #   plane = Plane.new
    #   subject.land(plane)
    #   subject.take_off(plane)
    #   expect(subject.planes).not_to include(plane)
    # end

    it 'prevents plane from take off when it stromy' do
      plane = Plane.new
      Weather.new.condition == 'stromy'
      expect(subject.take_off(plane)).to eq ("Sorry! Plane can not take due to bad weather condition")
    end

  end
end
