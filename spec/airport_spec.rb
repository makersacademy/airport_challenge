require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  it { expect(subject).to respond_to(:land).with(1).argument }
  it { expect(subject).to respond_to(:in_airport? ).with(1).argument }
  it { expect(subject).to respond_to(:take_off).with(1).argument }

  describe '#land' do
    let(:plane) {double(:plane)}

    it 'stores a plane in an airport' do
      subject.land(plane)
      expect(subject.landed_planes).to include plane
    end
  end

  describe '#take_off' do
    let(:plane) {double(:plane)}
      it 'removes plane from an airport' do
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.landed_planes).not_to include plane
      end
  end

  describe '#plane_landed?' do
    let(:plane) {double(:plane)}

    it 'confirms the plane is in the airport'  do
      subject.land(plane)
      expect(subject.in_airport?(plane)).to be true
    end

    it 'confirms the plane is not at the aiport' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.in_airport?(plane)).to be false
    end
  end
end
