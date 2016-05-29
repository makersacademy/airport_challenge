require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  let(:plane) { double(:plane) }
  let(:airport) { Airport.new(25) }

  it 'can have its capacity overriden doesn\'t allow planes to land if full' do
    allow(plane).to receive(:land).and_return(plane)
    airport.capacity.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error(
    RuntimeError,
    "Airport is full!")
  end

  describe '#land' do
    it 'allows plane to land' do
      allow(plane).to receive(:land).and_return(plane)
      expect(subject.land(plane)).to eq plane
    end
  end

  describe '#take_off' do
    it 'allows plane to take off' do
      allow(plane).to receive(:take_off).and_return(plane)
      allow(plane).to receive(:airport).and_return(nil)
      expect(subject.take_off(plane).airport).to be_nil
    end
  end
end
