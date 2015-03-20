require 'airport'

describe Airport do
  let(:plane) { double :plane }

  context 'taking off and landing' do

    it 'a plane can land' do
      allow(subject).to receive(:local_weather) { 'sunny' }
      subject.land plane
    end

    it 'a plane can take off' do
      allow(subject).to receive(:local_weather) { 'sunny' }
      subject.land plane
      subject.take_off
    end
  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      allow(subject).to receive(:local_weather) { 'sunny' }
      6.times { subject.land(double :plane) }
      expect { subject.land plane }.to raise_error 'airport is full'
    end

    it 'a plane can land if airport is not full' do
      allow(subject).to receive(:local_weather) { 'sunny' }
      4.times { subject.land(double :plane) }
      expect { subject.land plane }.not_to raise_error
    end

    it 'can not issue take off requests if no airplanes' do
      allow(subject).to receive(:local_weather) { 'sunny' }
      expect { subject.take_off }.to raise_error 'airport is currently empty'
    end
  end

  context 'weather conditions' do

    it 'can check its local weather conditions' do
      expect(subject.local_weather).to eq('stormy').or eq 'sunny'
    end

    it 'a plane cannot take off when there is a storm brewing' do
      subject.land plane
      allow(subject).to receive(:local_weather) { 'stormy' }
      expect { subject.take_off }.to raise_error 'not now, storms brewing!'
    end

    it 'a plane cannot land in the middle of a storm' do
      allow(subject).to receive(:local_weather) { 'stormy' }
      expect { subject.land plane }.to raise_error 'not now, storms brewing!'
    end
  end
end
