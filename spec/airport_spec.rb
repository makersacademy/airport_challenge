# frozen_literal_string: true

require 'airport'

RSpec.describe Airport do
  let(:plane) { Plane.new }
  let(:weather) { double('weather') }
  let(:airport) { described_class.new(weather) }

  before(:each) { stub_stormy_weather(false) }

  it { expect(airport).to respond_to(:land).with(1).argument }

  it { expect(airport).to respond_to(:take_off) }

  it 'has a capacity default of 3' do
    capacity = airport.instance_variable_get(:@capacity)

    expect(capacity).to eq 3
  end

  describe '#land' do
    it 'lands a plan at airport' do
      airport.land(plane)

      expect(airport.hanger.first).to eq plane
    end

    it 'raises error if airport is already full' do
      (1..3).each { airport.land(Plane.new) }

      expect { airport.land(plane) }.to raise_error 'Airport is full'
    end

    context 'when capacity is set to 4' do
      let(:airport) { described_class.new(weather, 4) }

      it 'raises error if airport already has 4 planes' do
        (1..4).each { airport.land(Plane.new) }

        expect { airport.land(plane) }.to raise_error 'Airport is full'
      end

      it 'does not raises error if airport takes a 4th plane' do
        (1..3).each { airport.land(Plane.new) }

        expect { airport.land(plane) }.not_to raise_error
      end
    end

    context 'when weather is stormy' do
      before(:each) do
        stub_stormy_weather(true)
      end

      it 'raises error "landing prevented, weather is stormy"' do
        expect { airport.land(plane) }.to raise_error 'landing prevented, weather is stormy'
      end
    end
  end

  describe '#take_off' do
    it 'departs plane from airport' do
      empty_hanger = []
      airport.land(plane)

      airport.take_off

      expect(airport.hanger).to eq empty_hanger
    end

    it "returns the plan's status" do
      airport.land(plane)

      expect(airport.take_off).to include('the plane is now airborn')
    end

    context 'when weather is stormy' do
      before(:each) do
        stub_stormy_weather(true)
      end

      it 'raises error "take off prevented, weather is stormy"' do
        expect { airport.take_off }.to raise_error 'take off prevented, weather is stormy'
      end
    end
  end

  def stub_stormy_weather(boolen)
    allow(weather).to receive(:rare_stormy_weather?).and_return(boolen)
  end
end
