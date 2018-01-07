require "airport"

describe Airport do

  subject(:airport) { described_class.new(weather, 1) }
  let(:weather) { double :weather }

  describe 'cases when weather is not stormy' do
    before do
      allow(weather).to receive(:stormy?).and_return false
    end

  it 'lands a plane at airport' do
    plane = Plane.new
    expect(airport.land(plane)).to eq(plane)
  end

  it 'take off a plane from airport' do
    plane = Plane.new
    airport.land(plane)
    expect(airport.take_off(plane)).to eq []
  end

  it 'raises error if airport is full' do
    plane = Plane.new
    airport.land(plane)
    error = "Cannot land as airport is full"
    expect { airport.land(Plane.new) }.to raise_error error
  end
end

  describe 'cases when weather is stormy' do
    before do
      allow(weather).to receive(:stormy?).and_return true
    end

    it 'does not allow to land if weather is stormy' do
      plane = Plane.new
      message = "Cannot land due to stormy weather"
      expect { airport.land(plane) }.to raise_error message
    end
  end
end
