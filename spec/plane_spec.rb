require 'plane'

describe Plane do
  subject(:plane) {described_class.new}
  let(:airport) {double :airport}

  describe '#land' do
    it {expect(subject).to respond_to(:land)}
    it 'instructs the plane to land' do
      expect(subject).to receive(:land)
      subject.land(airport)
    end
    it 'confirms plane landed' do
      airport = Airport.new
      subject.land(airport)
      expect(subject.landed).to eq(true)
    end
  end
end
