require 'airport'

describe Airport do

  let(:plane) { double(Plane.new) }

  describe '#initializing capacity' do

    it 'has a #DEFAULT_CAPACITY of 20' do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it 'has an overridden capacity when specified' do
      airport = Airport.new(50)
      expect(airport.capacity).to eq 50
    end
  end

  describe '#land' do

    it 'lands a plane' do
    expect(subject).to respond_to(:land).with(1).argument
    end

    it 'does not land a plane when airport is full' do
    described_class::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
    expect{subject.land(Plane.new)}.to raise_error 'Airport is full!'
    end

    it 'does not land a plane when weather is stormy' do
      subject.weather
      if subject.good_weather == false
        expect{subject.land(plane)}.to raise_error 'Landing denied. Weather is stormy!'
      end
    end

    it 'does not land a plane that is not flying' do
      2.times { subject.land(Plane.new) }
      expect{subject.land(subject.planes[0])}.to raise_error 'Plane has already landed and is in airport'
    end
  end

  describe '#take_off' do

    it 'takes off a plane' do
      expect(subject).to respond_to(:take_off)
    end

    it 'does not take-off a plane when weather is stormy' do
      subject.land(plane)
      subject.weather
      if subject.good_weather == false
        expect{subject.take_off}.to raise_error 'Take-off denied. Weather is stormy!'
      end
    end

    it 'only takes-off a plane from the airport they are at' do
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'does not take-off a flying plane' do
      subject.land(plane)
      subject.take_off
      expect{subject.take_off}.to raise_error 'Cannot take-off an already flying plane'
    end

    it 'plane is no longer in airport after take-off' do
      subject.land(plane)
      subject.take_off
      expect(subject.planes).to be_empty
    end
  end
end
