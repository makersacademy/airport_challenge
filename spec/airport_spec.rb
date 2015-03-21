require 'airport'

describe Airport do

  let(:plane) { double :plane, touch_down: nil, take_off: nil }

  before { allow(subject).to receive(:local_weather).and_return('sunny') }

  context 'take off & landing' do
    it 'plane can land' do
      subject.land plane
    end

    it 'plane can take off' do
      subject.land plane
      subject.take_off
    end

    it 'tells plane it has landed' do
      expect(plane).to receive 'touch_down'
      subject.land plane
    end

    it 'tells a specific plane to take off' do
      subject.land plane
      plane2 = double :plane2, take_off: nil, touch_down: nil
      subject.land plane2
      expect(plane2).to receive(:take_off)
      subject.take_off plane2
    end

    it 'tells first plane take off if none specified' do
      subject.land plane
      plane2 = double :plane2, take_off: nil, touch_down: nil
      subject.land plane2
      expect(plane).to receive(:take_off)
      subject.take_off
    end

    it 'plane no longer in airport once taken off' do
      subject.land plane
      subject.take_off
      expect { subject.take_off }.to raise_error 'airport is currently empty'
    end
  end

  context 'traffic control' do

    it 'plane cannot land if full' do
      Airport::HANGAR_SIZE.times { subject.land double :plane, touch_down: nil }
      expect { subject.land plane }.to raise_error 'airport is full'
    end

    it 'plane can land if not full' do
      (Airport::HANGAR_SIZE - 1).times do
        subject.land(double :plane, touch_down: nil)
      end
      expect { subject.land plane }.not_to raise_error
    end

    it 'cannot issue take off requests if empty' do
      expect { subject.take_off }.to raise_error 'airport is currently empty'
    end
  end

  context 'weather conditions' do

    it 'cannot take off if storm' do
      subject.land plane
      allow(subject).to receive(:local_weather) { 'stormy' }
      expect { subject.take_off }.to raise_error 'not now, storms brewing!'
    end

    it 'cannot land if storm' do
      allow(subject).to receive(:local_weather) { 'stormy' }
      expect { subject.land plane }.to raise_error 'not now, storms brewing!'
    end
  end
end
