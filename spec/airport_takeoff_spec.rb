# frozen_string_literal: true

require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#takeoff' do
    it 'raises an error when trying to takeoff a plane not at this airport' do
      message = 'That plane is not at this airport.'
      expect { airport.takeoff(plane) }.to raise_error message
    end

    it 'raises an error if the weather is stormy' do
      message = 'The weather is stormy, planes cannot take off.'
      allow(airport).to receive(:check?) { true }
      expect { airport.takeoff(plane, true) }.to raise_error message
    end

    it 'removes the plane at the airport' do
      allow(airport).to receive(:type?) { true }
      airport.land(plane, false)
      airport.takeoff(plane, false)
      expect(airport.check?(plane)).to eq(false)
    end
  end
end
