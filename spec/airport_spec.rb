require 'airport'
require 'plane'

describe Airport do
  let(:weather) {double(:weather, stormy?: false)}

  describe '::new' do
    it {should be_instance_of(Airport)}
  end

  describe 'initialize airport at set capacity' do
    it 'sets default capacity if no argument is given' do
      5.times{subject.land(Plane.new)}
      expect {subject.land(Plane.new)}.to raise_error("Airport full")
    end
  end

  describe 'land' do
    it {should respond_to(:land)}
    it 'instructs plane to land' do
      expect(subject.land(Plane.new))
    end
    #it 'raises an error if airport is full' do
      #50.times{subject.land(Plane.new)}
      #expect {subject.land(Plane.new)}.to raise_error("Airport full")
    #end
    #it 'raises an error if weather is bad' do
      #expect {subject.land(Plane.new)}.to raise_error("Weather not suitable")
    #end
  end

  describe 'takeoff' do
    it {should respond_to(:takeoff)}
    it 'instructs plane to takeoff' do
      subject.land(Plane.new)
      expect{(subject.takeoff)}
    end
  end
end