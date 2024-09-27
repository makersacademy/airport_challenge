# frozen_literal_string: true

require 'airport'

RSpec.describe Airport do
  let(:plane_one) { Plane.new }
  let(:plane_two) { Plane.new }
  let(:weather) { double('weather') }
  let(:airport) { described_class.new(weather) }

  before(:each) { stub_stormy_weather(false) }

  it { expect(airport).to respond_to(:land).with(1).argument }

  it { expect(airport).to respond_to(:take_off).with(1).argument }

  it 'has a capacity default of 3' do
    capacity = airport.instance_variable_get(:@capacity)

    expect(capacity).to eq 3
  end

  it 'takes off and lands multiple planes with no errors' do
    multiple_planes = Array.new(20) { Plane.new }
    airport = Airport.new(weather, multiple_planes.length)

    expect do
      multiple_planes.each { |plane| airport.land(plane) }
      multiple_planes.each { |plane| airport.take_off(plane) }
    end.not_to raise_error
  end

  describe '#land' do
    it 'lands a plan at airport' do
      airport.land(plane_one)

      expect(airport.hanger.first).to eq plane_one
    end

    it 'raises error if airport is already full' do
      capacity = Airport::DEFAULT_CAPACITY

      capacity.times { airport.land(Plane.new) }

      expect { airport.land(plane_one) }.to raise_error 'Airport is full'
    end
    it 'raises error if plane is not airborne' do
      airport.land(plane_one)

      expect { airport.land(plane_one) }.to raise_error 'This plane is not airborne'
    end

    context 'when capacity is set to 4' do
      let(:airport) { described_class.new(weather, 4) }
      let(:capacity) { Airport::DEFAULT_CAPACITY + 1 }

      it 'raises error if airport already has 4 planes' do
        capacity.times { airport.land(Plane.new) }

        expect { airport.land(plane_one) }.to raise_error 'Airport is full'
      end

      it 'does not raises error if airport takes a 4th plane' do
        (capacity - 1).times { airport.land(Plane.new) }

        expect { airport.land(plane_one) }.not_to raise_error
      end
    end

    context 'when weather is stormy' do
      before(:each) do
        stub_stormy_weather(true)
      end

      it 'raises error "landing prevented, weather is stormy"' do
        expect { airport.land(plane_one) }.to raise_error 'landing prevented, weather is stormy'
      end
    end
  end

  describe '#take_off' do
    it 'departs plane from airport' do
      empty_hanger = []
      airport.land(plane_one)

      airport.take_off(plane_one)

      expect(airport.hanger).to eq empty_hanger
    end

    it 'only departs plane already in airport' do
      airport.land(plane_one)
      airport.land(plane_two)

      airport.take_off(plane_one)

      expect(airport.hanger).to include(plane_two)
    end

    it "returns the plan's status" do
      airport.land(plane_one)

      expect(airport.take_off(plane_one)).to include('the plane is now airborn')
    end

    it 'can not take off plane that is that is not in airport' do
      airport.land(plane_two)

      expect { airport.take_off(plane_one) }.to raise_error 'Plane not in airport'
    end

    context 'when weather is stormy' do
      before(:each) do
        airport.land(plane_one)
        stub_stormy_weather(true)
      end

      it 'raises error "take off prevented, weather is stormy"' do
        expect { airport.take_off(plane_one) }.to raise_error 'take off prevented, weather is stormy'
      end
    end
  end

  def stub_stormy_weather(boolen)
    allow(weather).to receive(:rare_stormy_weather?).and_return(boolen)
  end
end
