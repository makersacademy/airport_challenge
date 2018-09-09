require 'airport'

class PlaneMock
  attr_accessor :flying
  def initialize(flying = true)
    @flying = flying
  end
end

describe Airport do
  RSpec.configure do |config|
    config.before(:each) do
      allow(subject).to receive(:stormy?) { false }
    end
  end

  context 'creates a new airport that has a capacity' do
    it { is_expected.to have_attributes(airport_capacity: 20) }
  end

  context 'landing' do
    before(:each) do
      @plane = PlaneMock.new
    end

    it 'lets plane land and confirms plane is in hangar' do
      subject.land(@plane)
      expect(subject.plane_in_hangar?(@plane)).to eq true
    end

    it 'outputs that plane has landed' do
      expect(subject.land(@plane)).to eq 'Plane has landed!'
    end

    it 'prevents a plane to land if already landed' do
      subject.land(@plane)
      expect { subject.land(@plane) }.to raise_error('Plane already landed!')
    end
  end

  context 'take off' do
    it 'lets specific plane take off and confirms plane is not in hangar' do
      plane1 = PlaneMock.new
      plane2 = PlaneMock.new
      subject.land(plane1)
      subject.land(plane2)
      subject.take_off(plane1)
      expect(subject.plane_in_hangar?(plane1)).to eq false
    end

    it 'outputs that a plane has taken off' do
      plane = PlaneMock.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq 'Plane has taken off!'
    end

    it 'prevents a plane to take off if already flying' do
      plane = PlaneMock.new
      subject.land(plane)
      subject.take_off(plane)
      expect { subject.take_off(plane) }.to raise_error('Plane already flying!')
    end

    it 'prevents a plane to take off if not in hangar' do
      plane = PlaneMock.new(false)
      expect { subject.take_off(plane) }.to raise_error('Plane not in hangar!')
    end
  end

  context 'when weather is stormy' do
    before(:each) do
      @plane = PlaneMock.new
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
      expect(subject.airport_capacity).to eq 20
    end

    it 'allows the default capacity to be overridden' do
      airport_capacity = 30
      airport = Airport.new(airport_capacity)
      expect(airport.airport_capacity).to eq(airport_capacity)
    end

    it 'checks if it is full' do
      20.times { subject.land(PlaneMock.new) }
      expect(subject.full?).to eq true
    end

    it 'prevents landing when it is full' do
      20.times { subject.land(PlaneMock.new) }
      expect { subject.land(PlaneMock.new) }.to raise_error('Airport is full!')
    end
  end
end
