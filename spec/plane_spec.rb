require 'plane'
require 'passenger'
require 'ticket'
require 'airport'

describe Plane do
  context 'flying' do
    it 'checks if flying' do
      expect(subject.flying?).to eq true
    end

    it 'allows flying to be changed' do
      plane = Plane.new(false)
      expect(plane.flying?).to eq(false)
    end
  end

  context 'boarding' do
    it 'accepts a passenger on board' do
      subject.flying = false
      passenger = Passenger.new
      subject.board(passenger)
      expect(subject.on_board?(passenger)).to eq true
    end

    it 'prevents boarding of a passenger if already on board' do
      passenger = Passenger.new
      subject.flying = false
      subject.board(passenger)
      expect { subject.board(passenger) }.to raise_error('Passenger already on board!')
    end

    it 'prevents boarding if flying' do
      subject.flying = true
      expect { subject.board(Passenger.new) }.to raise_error('Plane is flying!')
    end

    it 'prevents boarding if passenger has no ticket' do
      subject.flying = false
      passenger = Passenger.new(false)
      expect { subject.board(passenger) }.to raise_error('Passenger does not have a ticket!')
    end
  end

  context 'disembarking' do

    it 'lets a specific passenger off the plane and confirms passenger is not in plane' do
      subject.flying = false
      passenger1 = Passenger.new
      passenger2 = Passenger.new
      subject.board(passenger1)
      subject.board(passenger2)
      subject.disembark(passenger1)
      expect(subject.on_board?(passenger1)).to be false
    end

    it 'prevents a passenger disembarking if already off the plane' do
      subject.flying = false
      passenger = Passenger.new
      subject.board(passenger)
      subject.disembark(passenger)
      expect { subject.disembark(passenger) }.to raise_error('Passenger already off the plane!')
    end

    it 'prevents a passenger disembarking if plane is flying' do
      subject.flying = false
      passenger = Passenger.new
      subject.board(passenger)
      subject.flying = true
      expect { subject.disembark(passenger) }.to raise_error('Plane is flying!')
    end
  end

  context 'capacity' do
    it 'sets default capacity to 100' do
      expect(subject.plane_capacity).to eq 100
    end

    it 'allows the default capacity to be overridden' do
      plane_capacity = 150
      plane = Plane.new(false, plane_capacity)
      expect(plane.plane_capacity).to eq(plane_capacity)
    end

    it 'checks if it is full' do
      subject.flying = false
      100.times { subject.board(Passenger.new) }
      expect(subject.plane_full?).to eq true
    end

    it 'prevents boarding if it is full' do
      subject.flying = false
      100.times { subject.board(Passenger.new) }
      expect { subject.board(Passenger.new) }.to raise_error('Plane is full!')
    end
  end
end
