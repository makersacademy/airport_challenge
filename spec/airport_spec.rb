require 'weather'
require 'airport'
require 'plane'

describe Airport do

  context 'tests landing planes' do

    it 'should be able to hold a landed plane' do
      expect(subject.planes).to eq []
    end

    it 'should be able to respond to the method land' do
      expect(subject).to respond_to(:land)
    end

    it 'should be able to respond to the method land with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'should be able to land a plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

  end

  context 'tests planes taking off' do
    let(:plane) { double(:plane) }
    let(:weather) { double(:weather) }
    it 'should respond to the method take off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'should remove a plane from the airport if not stormy' do
      allow(plane).to receive(:instance_of?).and_return(Plane)
      allow(weather).to receive(:weather_generator).and_return(false)
      subject.land(plane)
      count = subject.planes.count
      subject.take_off
      expect(subject.planes.count).to eq(count - 1)
    end

    it 'should not remove a plane from the airport if stormy' do
      allow(plane).to receive(:instance_of?).and_return(Plane)
      double(:weather => true)
      subject.land(plane)
      count = subject.planes.count
      subject.take_off
      expect(subject.planes.count).to eq(count)
    end

  end

  context 'weather dependency tests' do

    let(:weather) { double(:weather) }
    it 'should return true if weather is not stormy' do
      allow(weather).to receive(:weather_generator).and_return(true)
      expect(subject.stormy?(weather.weather_generator)).to eq true
    end

    it 'should return false if weather is stormy' do
      allow(weather).to receive(:weather_generator).and_return(false)
      expect(subject.stormy?(weather.weather_generator)).to eq false
    end


  end
end
