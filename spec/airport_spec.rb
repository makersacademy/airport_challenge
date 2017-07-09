require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  # let(:weather) { double(:weather, stormy?: false) }

  describe '#initialize' do
    it 'has a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  it { is_expected.to respond_to(:plane) }

  describe 'a group of landing tests that need weather to not be stormy' do
    before do
      allow(airport.weather).to receive(:stormy?).and_return(false)
    end

    describe '#land' do

      it { is_expected.to respond_to(:land).with(1).argument }

      it 'lands something' do
        plane = Plane.new
        expect(airport.land(plane)).to eq [plane]
      end

      it 'confirms that a plane has landed' do
        plane = Plane.new
        airport.land(plane)
        expect(airport.plane).to eq plane
      end

      it 'prevents landing when full' do
        Airport::DEFAULT_CAPACITY.times do
          airport.land(Plane.new)
        end
        expect { airport.land(Plane.new) }.to raise_error "Airport full"
      end

      it 'tells a plane that it is no longer flying' do
        plane = Plane.new
        airport.land(plane)
        expect(plane.flying?).to eq false
      end

      it 'tells a plane that it has landed' do
        plane = Plane.new
        airport.land(plane)
        expect(plane.landed?).to eq true
      end

      it 'raises an error if a plane tries to land when it is already landed' do
        plane = Plane.new
        airport.land(plane)
        expect { airport.land(plane) }.to raise_error "#{plane} has already landed"
      end
    end

  end

  describe '#land' do

    it 'prevents a plane from landing if the weather is stormy' do
      plane = Plane.new
      allow(airport.weather).to receive(:stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error "Storms prevent landing"
    end
  end

  describe 'a group of take off tests that require weather to not be stormy' do

    before do
      allow(airport.weather).to receive(:stormy?).and_return(false)
    end

    describe '#take_off' do

      it { is_expected.to respond_to(:take_off).with(1).argument }

      it 'confirms that a plane has taken off' do
        plane = Plane.new
        airport.land(plane)
        expect(airport.take_off(plane)).to eq "#{plane} has taken off"
      end

      it 'confirms that a plane is no longer in the airport after take off' do
        plane = Plane.new
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.plane).to eq nil
      end

      it 'allows a plane to take off when the weather is not stormy' do
        plane = Plane.new
        airport.land(plane)
        expect { airport.take_off(plane) }.not_to raise_error
      end

      it 'tells a plane it is now flying' do
        plane = Plane.new
        airport.land(plane)
        airport.take_off(plane)
        expect(plane.flying?).to eq true
      end

      it 'tells a plane it is no longer landed' do
        plane = Plane.new
        airport.land(plane)
        airport.take_off(plane)
        expect(plane.landed?).to eq false
      end

      it 'raises an error if a plane tries to take off when it is flying' do
        plane1 = Plane.new
        plane2 = Plane.new
        airport.land(plane1)
        expect { airport.take_off(plane2) }.to raise_error "Cannot take off. #{plane2} is flying"
      end
    end
  end

  describe '#take_off' do

    it 'prevents a plane from taking off when the weather is stormy' do
      plane = Plane.new
      allow(airport.weather).to receive(:stormy?).and_return(false)
      airport.land(plane)
      allow(airport.weather).to receive(:stormy?).and_return(true)
      expect { airport.take_off(plane) }.to raise_error "Storms prevent take off"
    end
  end
end
