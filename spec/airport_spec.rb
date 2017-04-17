require 'airport'

describe Airport do

  subject(:airport){described_class.new}
  let(:plane) {double :plane}
  let(:weather) {double :weather}

  it 'instruct plane to land' do
    expect(airport).to receive(:land)
    airport.land(plane)
  end

  it 'instruct plane to take off' do
    expect(airport).to receive(:take_off)
    airport.take_off(plane)
  end

  context 'when stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return true
    end

    it 'cannot take off when stormy' do
      expect{airport.take_off(plane)}.to raise_error("Cannot take off: weather stormy")
    end

  end
end
