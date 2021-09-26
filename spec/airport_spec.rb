# frozen_literal_string: true

require 'airport'

RSpec.describe Airport do
  let(:airport) { described_class.new }
  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off) }

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
      let(:airport) { described_class.new(4) }

      it 'raises error if airport already has 4 planes' do
        (1..4).each { airport.land(Plane.new) }

        expect { airport.land(plane) }.to raise_error 'Airport is full'
      end

      it 'does not raises error if airport takes a 4th plane' do
        (1..3).each { airport.land(Plane.new) }

        expect { airport.land(plane) }.not_to raise_error
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
  end
end
