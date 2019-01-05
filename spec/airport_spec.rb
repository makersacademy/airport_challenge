require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    it 'raises an error when trying to land not-a-Plane' do
      message = 'That is not a plane.'
      expect { airport.land('car') }.to raise_error message
    end

    it 'raises an error if the airport is full' do
      allow(airport).to receive(:type?) { true }
      allow(airport).to receive(:full?) { true }
      message = 'The airport is full.'
      expect { airport.land(plane) }.to raise_error message
    end

    it 'raises an error if the weather is stormy' do
      allow(airport).to receive(:type?) { true }
      message = 'The weather is stormy, planes cannot land.'
      expect { airport.land(plane, true) }.to raise_error message
    end

    it 'adds the plane at the airport' do
      allow(airport).to receive(:type?) { true }
      airport.land(plane, false)
      expect(airport.check?(plane)).to eq(true)
    end
  end

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
