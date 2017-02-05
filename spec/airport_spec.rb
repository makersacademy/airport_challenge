require 'weather'
require 'airport'
require 'plane'

describe Airport do

  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }

  context 'tests landing planes' do

    before { allow(plane).to receive(:status_to_in_airport).and_return(:in_airport) }

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
      allow(plane).to receive(:status).and_return(:in_air)
      allow(weather).to receive(:weather_generator).and_return(false)
      subject.land(plane, weather.weather_generator)
      expect(subject.planes).to eq [plane]
    end

    it 'should not land a plan when the weather is stormy' do
      allow(plane).to receive(:status).and_return(:in_air)
      allow(weather).to receive(:weather_generator).and_return(true)
      subject.land(plane, weather.weather_generator)
      expect(subject.planes).to eq []
    end

    it 'should test that once a plane has landed its status changes' do
      allow(plane).to receive(:status).and_return(:in_air)
      allow(weather).to receive(:weather_generator).and_return(false)
      subject.land(plane, weather.weather_generator)
    end

    it 'should test that plans status changes to landed, once it is landed' do
      allow(weather).to receive(:weather_generator).and_return(false)
      plane1 = Plane.new
      subject.land(plane1, weather.weather_generator)
      expect(plane1.status).to eq :in_airport
    end

    it 'should raise error if trying to land a plane that has already landed' do
      allow(weather).to receive(:weather_generator).and_return(false)
      plane1 = Plane.new
      plane1.status_to_in_airport
      expect{subject.land(plane1, weather.weather_generator)}.to raise_error(RuntimeError, "Cannot land a plane that has already landed!")
    end

  end

  context 'tests planes taking off' do

    before do
      allow(plane).to receive(:status_to_in_air).and_return(:in_air)
      allow(plane).to receive(:status_to_in_airport).and_return(:in_airport)

    end

    it 'should respond to the method take off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'should remove a plane from the airport if not stormy' do
      allow(plane).to receive(:status).and_return(:in_air)
      allow(weather).to receive(:weather_generator).and_return(false)
      subject.land(plane, weather.weather_generator)
      count = subject.planes.count
      allow(plane).to receive(:status).and_return(:in_airport)
      subject.take_off(plane, weather.weather_generator)
      expect(subject.planes.count).to eq(count - 1)
    end

    it 'should not remove a plane from the airport if stormy' do
      allow(plane).to receive(:status).and_return(:in_air)
      allow(weather).to receive(:weather_generator).and_return(true)
      subject.land(plane, weather.weather_generator)
      count = subject.planes.count
      allow(plane).to receive(:status).and_return(:in_airport)
      subject.take_off(plane, weather.weather_generator)
      expect(subject.planes.count).to eq(count)
    end

    it 'should test if plane status changes when plane takes off' do
      allow(weather).to receive(:weather_generator).and_return(false)
      plane1 = Plane.new
      subject.land(plane1, weather.weather_generator)
      subject.take_off(plane1, weather.weather_generator)
      expect(plane1.status).to eq :in_air
    end

    it 'should test that error is raised if plane has already taken off' do
      allow(weather).to receive(:weather_generator).and_return(false)
      plane1 = Plane.new
      subject.land(plane1, weather.weather_generator)
      plane1.status_to_in_air
      expect{subject.take_off(plane1, weather.weather_generator)}.to raise_error(RuntimeError, "A plane that is already in the air cannot take off!")
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

    before { allow(plane).to receive(:status_to_in_airport).and_return(:in_airport) }

    it 'should test for airport capacity' do
      expect(subject.capacity).to eq 20
    end

    it 'should test that planes cant land when airport is full' do
      allow(plane).to receive(:status).and_return(:in_air)
      allow(weather).to receive(:weather_generator).and_return(false)
      20.times { subject.land(plane, weather.weather_generator) }
      count = subject.planes.count
      subject.land(plane, weather.weather_generator)
      expect(subject.planes.count).to eq count
    end

  end

end
