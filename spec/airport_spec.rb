require 'airport'
require 'plane'
require 'weather'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  describe '#land' do
    context 'when good weather conditions' do
      before do
        allow(airport).to receive(:stormy_weather?).and_return(false)
      end

      it 'accepts a plane to land when good weather conditions' do
        allow(airport).to receive(:at_airport).and_return(false)
        expect(airport.land(plane)).to eq [plane]
      end

      it 'prevents landing when plane already landed at same airport' do
        allow(airport).to receive(:at_airport).and_return(true)
        expect { airport.land(plane) }.to raise_error 'This plane is already at this airport.' 
      end

      it 'prevents landing when plane already landed at other airport' do
        allow(plane).to receive(:grounded).and_return(true)
        expect { airport.land(plane) }.to raise_error 'This plane is already at an airport.' 
      end

      it 'prevents landing when airport is full' do
        allow(airport).to receive(:at_airport).and_return(false)
        allow(plane).to receive(:grounded).and_return(false)
        Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error 'Airport capacity reached. No more landing allowed.'
      end
    end

    context 'when bad weather conditions: stormy weather' do
      before do
        allow(airport).to receive(:stormy_weather?).and_return(true)
      end

      it 'prevents landing when weather is stormy' do
        allow(airport).to receive(:at_airport).and_return(false)
        expect { airport.land(plane) }.to raise_error 'Warning: stormy weather! Landing not allowed.'
      end
    end
  end

  describe '#take_off' do
    context 'when good weather conditions' do
      before do
        allow(airport).to receive(:stormy_weather?).and_return(false)
      end
      
      it 'allows plane to take off when good weather conditions' do
        allow(airport).to receive(:left_airport?).and_return(false)
        airport.land(plane)
        expect(airport.take_off(plane)).to eq plane
      end

      it 'prevents takeoff if plane already took off' do
        allow(airport).to receive(:left_airport?).and_return(true)
        expect { airport.take_off(plane) }.to raise_error 'This plane has already taken off.' 
      end

      it 'prevents takeoff if plane not at airport' do
        allow(airport).to receive(:left_airport?).and_return(false)
        allow(airport).to receive(:at_airport).and_return(false)
        expect { airport.take_off(plane) }.to raise_error 'This plane is not at this airport.'
      end
    end

    context 'when bad weather conditions: stormy weather' do
      before do
        allow(airport).to receive(:stormy_weather?).and_return(true)
      end

      it 'prevents takeoff when weather is stormy' do
        allow(airport).to receive(:left_airport?).and_return(false)
        allow(airport).to receive(:at_airport).and_return(true)
        expect { airport.take_off(plane) }.to raise_error 'Warning: stormy weather! Takeoff not allowed.'
      end
    end
  end
end
