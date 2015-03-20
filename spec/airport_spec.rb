require 'airport'

describe Airport do
  let(:plane) { double :plane }

  context 'taking off and landing' do

    it 'a plane can land' do
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
      6.times { subject.land(double :plane) }
      expect { subject.land plane }.to raise_error 'airport is full'
    end

    it 'a plane can land if airport is not full' do
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
      airport = Airport.new
      airport.land plane
      allow(airport).to receive(:local_weather) { 'stormy' }
      expect { airport.take_off }.to raise_error 'not now, storms brewing!'
    end

    xit 'a plane cannot land in the middle of a storm'
  end
end
