require 'weather'
require 'airport'
require 'plane'

describe Airport do

  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }

  context 'tests landing planes' do

    it 'should be able to hold a landed plane' do
      expect(subject.planes).to eq []
    end

    it 'should be able to respond to the method land' do
      expect(subject).to respond_to(:land)
    end

    it 'should be able to respond to the method land with one argument' do
      expect(subject).to respond_to(:land).with(2).arguments
    end

    it 'should be able to land a plane when weather is good' do
      allow(weather).to receive(:weather_generator).and_return(false)
      subject.land(plane, weather.weather_generator)
      expect(subject.planes).to eq [plane]
    end

    it 'should not land a plan when the weather is stormy' do
      allow(weather).to receive(:weather_generator).and_return(true)
      subject.land(plane, weather.weather_generator)
      expect(subject.planes).to eq []
    end

  end

  context 'tests planes taking off' do

    it 'should respond to the method take off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'should remove a plane from the airport if not stormy' do
      allow(weather).to receive(:weather_generator).and_return(false)
      subject.land(plane, weather.weather_generator)
      count = subject.planes.count
      subject.take_off(weather.weather_generator)
      expect(subject.planes.count).to eq(count - 1)
    end

    it 'should not remove a plane from the airport if stormy' do
      allow(weather).to receive(:weather_generator).and_return(true)
      subject.land(plane, weather.weather_generator)
      count = subject.planes.count
      subject.take_off(weather.weather_generator)
      expect(subject.planes.count).to eq(count)
    end
  end

  context 'weather dependency tests' do

    it 'should return true if weather is not stormy' do
      allow(weather).to receive(:weather_generator).and_return(true)
      expect(subject.stormy?(weather.weather_generator)).to eq true
    end

    it 'should return false if weather is stormy' do
      allow(weather).to receive(:weather_generator).and_return(false)
      expect(subject.stormy?(weather.weather_generator)).to eq false
    end
  end

  context 'airport capacity tests' do

    it 'should test for airport capacity' do
      expect(subject.capacity).to eq 20
    end

    it 'should test that planes cant land when airport is full' do
      allow(weather).to receive(:weather_generator).and_return(false)
      20.times { subject.land(plane, weather.weather_generator) }
      count = subject.planes.count
      subject.land(plane, weather.weather_generator)
      expect(subject.planes.count).to eq count
    end

  end

end
