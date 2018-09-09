require 'plane'

describe Plane do

  context 'creates a new plane that can be flying and has a capacity' do
    it { is_expected.to have_attributes(flying: true) }
    it { is_expected.to have_attributes(plane_capacity: 100) }
  end

  context 'flying' do
    it 'checks if flying' do
      expect(subject.flying?).to eq true
    end

    it 'allows the default flying state to be changed' do
      plane = Plane.new(false)
      expect(plane.flying?).to eq(false)
    end

    it 'changes flying status on take off' do
      plane = Plane.new(false)
      plane.takeoff
      expect(plane.flying?).to eq(true)
    end

    it 'changes flying status on land' do
      plane = Plane.new
      plane.landed
      expect(plane.flying?).to eq(false)
    end
  end

  context 'boarding' do
    let(:passenger) { double :passenger, ticket?: true, boarded: true }

    it 'accepts a passenger on board' do
      subject.landed
      subject.board(passenger)
      expect(subject.on_board?(passenger)).to eq true
    end

    it 'outputs that a passenger is on board' do
      subject.landed

      expect(subject.board(passenger)).to eq('Passenger on board!')
    end

    it 'prevents boarding of a passenger if already on board' do

      subject.landed
      subject.board(passenger)
      expect { subject.board(passenger) }.to raise_error('Passenger already on board!')
    end

    it 'prevents boarding if flying' do
      subject.takeoff
      expect { subject.board(passenger) }.to raise_error('Plane is flying!')
    end

    it 'prevents boarding if passenger has no ticket' do
      subject.landed
      allow(passenger).to receive(:ticket?) { false }
      expect { subject.board(passenger) }.to raise_error('Passenger does not have a ticket!')
    end
  end

  context 'disembarking' do

    let(:passenger) { double :passenger, ticket?: true, boarded: true, leave: true }
    let(:passenger1) { double :passenger, ticket?: true, boarded: true, leave: true }
    let(:passenger2) { double :passenger, ticket?: true, boarded: true }

    it 'lets a specific passenger off the plane and confirms passenger is not in plane' do
      subject.landed
      subject.board(passenger1)
      subject.board(passenger2)
      subject.disembark(passenger1)
      expect(subject.on_board?(passenger1)).to be false
    end

    it 'outputs that a passenger has disembark' do
      subject.landed
      subject.board(passenger)
      expect(subject.disembark(passenger)).to eq('Passenger has disembarked!')
    end

    it 'prevents a passenger disembarking if already off the plane' do
      subject.landed
      subject.board(passenger)
      subject.disembark(passenger)
      expect { subject.disembark(passenger) }.to raise_error('Passenger already off the plane!')
    end

    it 'prevents a passenger disembarking if plane is flying' do
      subject.landed
      subject.board(passenger)
      subject.takeoff
      expect { subject.disembark(passenger) }.to raise_error('Plane is flying!')
    end
  end

  context 'capacity' do
    let(:passenger) { double :passenger, ticket?: true, boarded: true, leave: true }

    it 'sets default capacity to 100' do
      expect(subject.plane_capacity).to eq 100
    end

    it 'allows the default capacity to be overridden' do
      plane_capacity = 150
      plane = Plane.new(false, plane_capacity)
      expect(plane.plane_capacity).to eq(plane_capacity)
    end

    it 'checks if it is full' do
      subject.landed
      100.times {
        passenger = double(:passenger, ticket?: true, boarded: true, leave: true)
        subject.board(passenger)
       }
      expect(subject.plane_full?).to eq true
    end

    it 'prevents boarding if it is full' do
      subject.landed
      100.times {
        passenger = double(:passenger, ticket?: true, boarded: true, leave: true)
        subject.board(passenger)
       }
       passenger = double(:passenger, ticket?: true, boarded: true, leave: true)
      expect { subject.board(passenger) }.to raise_error('Plane is full!')
    end
  end
end
