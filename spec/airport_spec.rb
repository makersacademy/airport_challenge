require 'airport'
require 'plane'
require 'weather'

describe Airport do
  before(:each) do
    @plane = Plane.new(true)
  end

  describe 'initialization' do
    before(:each) do
      allow(subject.weather).to receive(:stormy?) { false }
      @message = "Cannot land, airport full"
    end

    it 'has a default capacity' do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new(true)) }
      expect { subject.land(Plane.new(true)) }.to raise_error(@message)
    end
    it 'has an overridden capacity' do
      random_capacity = rand(100)
      subject { Airport.new(random_capacity) }
      subject.capacity.times { subject.land(Plane.new(true)) }
      expect { subject.land(Plane.new(true)) }.to raise_error(@message)
    end
  end

  context 'when sunny' do
    before(:each) do
      allow(subject.weather).to receive(:stormy?) { false }
    end

    describe '#land' do
      it 'lands a plane' do
        subject.land(@plane)
        expect(subject.planes).to include(@plane)
      end
      it 'prevents landing if airport is full' do
        subject.capacity.times { subject.land(Plane.new(true)) }
        message = "Cannot land, airport full"
        expect { subject.land(Plane.new(true)) }.to raise_error(message)
      end
      it 'cannot land plane if it is not airborne' do
        subject.land(@plane)
        message = "Plane not airborne"
        expect { subject.land(@plane) }.to raise_error(message)
      end
    end

    describe '#take_off' do
      it 'confirms plane is no longer at airport' do
        subject.land(@plane)
        subject.take_off(@plane)
        expect(subject.planes).not_to include(@plane)
      end
      it 'cannot take off if it is already airborne' do
        message = "Plane already airborne"
        expect { subject.take_off(@plane) }.to raise_error(message)
      end
      it 'cannot take off if it is not at this airport' do
        airport_1 = Airport.new
        airport_2 = Airport.new
        allow(airport_1.weather).to receive(:stormy?) { false }
        allow(airport_2.weather).to receive(:stormy?) { false }
        airport_1.land(@plane)
        airport_1.take_off(@plane)
        airport_2.land(@plane)
        message = "Plane not at this airport"
        expect { airport_1.take_off(@plane) }.to raise_error(message)
      end
    end
  end

  context 'when stormy' do
    before(:each) do
      allow(subject.weather).to receive(:stormy?) { true }
      @message = "Stormy weather prevents take off and landing"
    end

    it 'prevents take off' do
      @plane.airborne = false
      expect { subject.take_off(@plane) }.to raise_error(@message)
    end
    it 'prevents landing' do
      expect { subject.land(@plane) }.to raise_error(@message)
    end
  end
end
