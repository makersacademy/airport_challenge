# frozen_literal_string: true

require 'airport'

RSpec.describe Airport do
  let(:airport) { described_class.new }
  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off) }

  describe '#land' do
    it 'lands a plan at airport' do
      airport.land(plane)

      expect(airport.hanger.first).to eq plane
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
