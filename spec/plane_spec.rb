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
      expect(subject.flying).to eq(false)
    end
  end

  describe '#take_off' do
    it {expect(subject).to respond_to(:take_off)}
    it 'instructs the plane to take_off' do
      expect(subject).to receive(:take_off)
      subject.take_off(airport)
    end
    it 'confirms plane departed' do
      airport = Airport.new
      subject.take_off(airport)
      expect(subject.flying).to eq(true)
    end
  end
end
