require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  it { expect(subject).to respond_to(:land).with(1).argument }
  it { expect(subject).to respond_to(:plane_landed?).with(1).argument }

  describe '#land' do
    let(:plane) {double(:plane)}

    it 'land and stores a plane in an airport' do
      subject.land(plane)
      expect(subject.landed_planes).to include plane
    end


  end

  describe '#plane_landed?' do
    let(:plane) {double(:plane)}
    it 'confirms the plane has landed'  do
      10.times {subject.land(plane)}
      subject.land(plane)
      expect(subject.plane_landed?(plane)).to be  true
    end
  end

end
