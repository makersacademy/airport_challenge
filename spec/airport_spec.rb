require 'airport'
require 'weather'

describe Airport do

  let(:plane) { double :plane }
  let(:plane2) { double :plane }
  let(:plane3) { double :plane }
  let(:weather) { double :weather, :stormy? => false }

  subject(:airport) { Airport.new(weather) }

  describe '#land' do

    context 'when plane is airborne' do

      it 'lands plane' do
        allow(plane).to receive(:airborne?).and_return(true)
        allow(plane).to receive(:land).and_return(false)
        expect(airport.land(plane)).to eq [plane]
      end

      it 'will not land if airport is full' do
        allow(plane).to receive(:airborne?).and_return(true)
        allow(plane).to receive(:land).and_return(false)
        airport.capacity.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error "Airport is full"
      end

    end

    context 'when plane has landed' do

      before do
        allow(plane).to receive(:airborne?).and_return(true)
        allow(plane).to receive(:land).and_return(false)
        allow(plane2).to receive(:airborne?).and_return(true)
        allow(plane2).to receive(:land).and_return(false)
      end

      it 'stores plane when it lands' do
        airport.land(plane)
        expect(airport.planes).to include plane
      end

      it 'stores more than one plane that lands' do
        airport.land(plane)
        airport.land(plane2)
        expect(airport.planes).to eq([plane, plane2])
      end

      it 'cannot land if already landed' do
        airport.land(plane)
        allow(plane).to receive(:airborne?).and_return(false)
        expect { airport.land(plane) }.to raise_error "Plane has already landed"
      end

    end

    context 'when weather is stormy' do

      it 'does not land if weather is stormy' do
        allow(weather).to receive(:stormy?).and_return(true)
        expect { airport.land(plane) }.to raise_error "Stormy weather"
      end

    end

  end

  describe '#take_off' do

    before do
      allow(plane).to receive(:airborne?).and_return(true)
      allow(plane).to receive(:land).and_return(false)
      allow(weather).to receive(:stormy?).and_return(false)
      allow(plane2).to receive(:airborne?).and_return(true)
      allow(plane2).to receive(:land).and_return(false)
    end

    context 'when empty' do
      it 'will not take off if airport is empty' do
        allow(plane).to receive(:airborne?).and_return(false)
        allow(plane).to receive(:takeoff).and_return(false)
        expect { airport.take_off(plane) }.to raise_error "Airport is empty"
      end
    end

    context 'when plane has landed' do

      it 'takes off plane' do
        airport.land(plane)
        allow(plane).to receive(:airborne?).and_return(false)
        allow(plane).to receive(:takeoff).and_return(false)
        expect(airport.take_off(plane)).to eq "Confirmed: #{plane} has taken off"
      end

      it 'takes off correct plane' do

        airport.land(plane)
        airport.land(plane2)
        allow(plane).to receive(:airborne?).and_return(false)
        allow(plane).to receive(:takeoff).and_return(false)
        expect(airport.take_off(plane)).to eq "Confirmed: #{plane} has taken off"
      end

    end

    context 'when plane is airborne' do

      it 'cannot take off if airborne' do
        allow(plane).to receive(:airborne?).and_return(true)
        expect { airport.take_off(plane) }.to raise_error "Plane has already taken off"
      end

    end

    context 'when weather is stormy' do

      it 'does not take off if weather is stormy' do
        airport.land(plane)
        allow(plane).to receive(:airborne?).and_return(false)
        allow(weather).to receive(:stormy?).and_return(true)
        allow(plane).to receive(:takeoff).and_return(false)
        expect { airport.take_off(plane) }.to raise_error "Stormy weather"
      end

    end

  end

  describe 'capacity' do

    it 'has a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'can have default capacity overriden' do
      airport = Airport.new(weather, 7)
      expect(airport.capacity).to eq 7
    end

    context 'when airport is full' do

      it 'knows it is full' do
        allow(plane).to receive(:airborne?).and_return(true)
        allow(plane).to receive(:land).and_return(false)
        airport.capacity.times { airport.land(plane) }
        expect(airport).to be_full
      end

    end

  end

end
