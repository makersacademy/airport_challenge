require 'plane'

describe Plane do

  let(:plane) { described_class.new }

  context 'flying' do
    it 'returns true if flying' do
      expect(plane.flying?).to eq true
    end

    it 'allows the default flying state to be changed' do
      plane = Plane.new(false)

      expect(plane.flying?).to eq(false)
    end

    it 'returns true on takeoff' do
      plane = Plane.new(false)
      plane.takeoff

      expect(plane.flying?).to eq(true)
    end

    it 'returns true on landing' do
      plane = Plane.new
      plane.landed

      expect(plane.flying?).to eq(false)
    end
  end

  context '#board' do
    let(:passenger) { double :passenger, ticket?: true, boarded: true }

    it 'returns true if passenger is on board' do
      plane.landed
      plane.board(passenger)

      expect(plane.on_board?(passenger)).to eq true
    end

    it 'outputs that a passenger is on board' do
      plane.landed

      expect(plane.board(passenger)).to eq('Passenger on board!')
    end

    it 'raises an error if already on board' do

      plane.landed
      plane.board(passenger)

      expect { plane.board(passenger) }.to raise_error('Passenger already on board!')
    end

    it 'raises error if plane flying' do
      plane.takeoff

      expect { plane.board(passenger) }.to raise_error('Plane is flying!')
    end

    it 'raises error if passenger has no ticket' do
      plane.landed
      allow(passenger).to receive(:ticket?) { false }

      expect { plane.board(passenger) }.to raise_error('Passenger does not have a ticket!')
    end
  end

  context '#disembark' do

    let(:passenger) { double :passenger, ticket?: true, boarded: true, leave: true }
    let(:passenger1) { double :passenger, ticket?: true, boarded: true, leave: true }
    let(:passenger2) { double :passenger, ticket?: true, boarded: true }

    it 'returns false if passenger if passenger not on board' do
      plane.landed
      plane.board(passenger1)
      plane.board(passenger2)
      plane.disembark(passenger1)

      expect(plane.on_board?(passenger1)).to be false
    end

    it 'outputs that a passenger has disembark' do
      plane.landed
      plane.board(passenger)

      expect(plane.disembark(passenger)).to eq('Passenger has disembarked!')
    end

    it 'raises error if passenger already disembarked' do
      plane.landed
      plane.board(passenger)
      plane.disembark(passenger)

      expect { plane.disembark(passenger) }.to raise_error('Passenger already off the plane!')
    end

    it 'raises error if plane is flying' do
      plane.landed
      plane.board(passenger)
      plane.takeoff

      expect { plane.disembark(passenger) }.to raise_error('Plane is flying!')
    end
  end

  context 'capacity' do
    let(:passenger) { double :passenger, ticket?: true, boarded: true, leave: true }

    context 'has a default' do
      it 'is 100' do
        expect(plane.plane_capacity).to eq 100
      end
    end
    context 'can be overridden' do
      it 'returns 150 ' do
        plane = Plane.new(false, 150)
        expect(plane.plane_capacity).to eq(150)
      end
    end

    context '#plane_full?' do
      it 'checks if it is full' do
        plane.landed
        100.times do
          passenger = double(:passenger, ticket?: true, boarded: true, leave: true)
          plane.board(passenger)
        end

        expect(plane.plane_full?).to eq true
      end

      it 'raises error if full' do
        plane.landed
        100.times do
          passenger = double(:passenger, ticket?: true, boarded: true, leave: true)
          plane.board(passenger)
        end

        passenger = double(:passenger, ticket?: true, boarded: true, leave: true)
        expect { plane.board(passenger) }.to raise_error('Plane is full!')
      end
    end
  end
end
