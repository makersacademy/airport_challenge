require 'airport'
require 'plane'
require 'passenger'

describe Airport do
  RSpec.configure do |config|
    config.before(:each) do
      allow(subject).to receive(:stormy?) { false }
    end
  end

  context 'landing' do
    before(:each) do
      @plane = Plane.new
      subject.land(@plane)
    end

    it 'lets plane land and confirms plane is in hangar' do
      expect(subject.plane_in_hangar?(@plane)).to eq true
    end

    it 'prevents a plane to land if already landed' do
      expect { subject.land(@plane) }.to raise_error('Plane already landed!')
    end
  end

  context 'take off' do
    it 'lets specific plane take off and confirms plane is not in hangar' do
      plane1 = Plane.new
      plane2 = Plane.new
      subject.land(plane1)
      subject.land(plane2)
      subject.take_off(plane1)
      expect(subject.plane_in_hangar?(plane1)).to eq false
    end

    it 'prevents a plane to take off if already flying' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect { subject.take_off(plane) }.to raise_error('Plane already flying!')
    end
  end

  context 'when weather is stormy' do
    before(:each) do
      @plane = Plane.new
    end

    it 'prevents take off ' do
      subject.land(@plane)
      allow(subject).to receive(:stormy?) { true }
      expect { subject.take_off(@plane) }.to raise_error('No take off, weather is stormy!')
    end

    it 'prevents landing' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(@plane) }.to raise_error('No landing, weather is stormy!')
    end
  end

  context 'capacity' do
    it 'sets the default capacity to 20' do
      expect(subject.capacity).to eq 20
    end

    it 'allows the default capacity to be overridden' do
      capacity = 30
      airport = Airport.new(capacity)
      expect(airport.capacity).to eq(capacity)
    end

    it 'checks if it is full' do
      20.times { subject.land(Plane.new) }
      expect(subject.full?).to eq true
    end

    it 'prevents landing when it is full' do
      20.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error('Airport is full!')
    end
  end
end
