#Test Document to Test -
require 'airport'
require 'plane'

describe Airport do

    describe 'initialization' do
      subject { Airport.new }
      let(:plane) { Plane.new }
      it 'defaults capacity' do
        described_class::DEFAULT_CAPACITY.times do
          allow(subject).to receive(:weather_state) { 'sunny' }
          subject.land(plane)
        end
        allow(subject).to receive(:weather_state) { 'sunny' }
        expect { subject.land(plane) }.to raise_error 'Airport is full'
        end
    end

    it 'default capacity is 10 planes' do
      expect(subject.capacity).to eq 10
    end

    it 'lands a plane' do
      plane = Plane.new
      allow(subject).to receive(:weather_state) { 'sunny' }
      expect(subject.land(plane)).to eq [plane]
    end

    it 'takes off a plane' do
      plane = Plane.new
      allow(subject).to receive(:weather_state) { 'sunny' }
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'raises error when airport is empty tyring to take off plane' do
      allow(subject).to receive(:weather) { 'sunny' }
    expect { subject.take_off }.to raise_error 'No planes at airport'
    end

    it 'raises error when airport is full' do
      allow(subject).to receive(:weather_state) { 'sunny' }
      subject.capacity.times {subject.land Plane.new}
      expect { subject.land(Plane.new) }.to raise_error 'Airport is full'
    end

    it 'state of weather' do
      allow(subject).to receive(:weather_state) { 'stormy' }
      expect(subject.weather_state).to eq 'stormy'
    end

    it 'raises error when trying to land in stormy weather' do
      allow(subject).to receive(:weather_state) { 'stormy' }
      expect { subject.land(Plane.new) }.to raise_error 'Weather is stormy'
    end
end
