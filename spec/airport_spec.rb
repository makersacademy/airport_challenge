require 'airport'
require 'plane'

describe Airport do
  let(:weather) { double :weather }

  describe '::new' do
    it {should be_instance_of(Airport)}
  end

  describe 'initialize airports at set capacity' do
    it 'sets default capacity if no argument is given' do
      allow(subject).to receive(:stormy?).and_return(false)
      5.times{subject.land(Plane.new)}
      expect{subject.land(Plane.new)}.to raise_error("Airport full")
    end
  end

  describe 'land' do
    it {should respond_to(:land)}
    it 'raises an error if airport is full' do
      allow(subject).to receive(:stormy?).and_return(false)
      5.times{subject.land(Plane.new)}
      expect{subject.land(Plane.new)}.to raise_error("Airport full")
    end
    it 'prevents plane from landing if stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect{subject.land(Plane.new)}.to raise_error("Weather not good for landing")
    end
  end

  describe 'takeoff' do
    it {should respond_to(:takeoff)}
    it 'instructs plane to takeoff' do
      allow(subject).to receive(:stormy?).and_return(false)
      plane = Plane.new
      subject.land(plane)
      expect{(subject.takeoff(plane))}
    end

    it 'prevents plane from taking off if stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
    expect{subject.land(Plane.new)}.to raise_error("Weather not good for landing")
    end
  end
end