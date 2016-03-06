require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  it { expect(subject).to respond_to(:land).with(1).argument }
  describe '#initialize' do
    it 'starts with no planes' do
      expect(subject.planes_in_airport).to be_empty
    end
  end

  describe '#land' do
    let (:plane) {double(:plane)}

    it 'stores plane in an airport' do
      allow(plane).to receive(:landed).and_return(true)
      subject.land(plane)
      expect(subject.planes_in_airport).to include plane
    end
  end
end
