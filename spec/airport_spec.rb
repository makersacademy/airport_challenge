require 'airport'

describe Airport do
  before :each do
    subject { described_class.new }
  end

  describe '#land' do
    let(:plane) { double :plane }
    it { expect(subject.land(:plane)).to eq :plane }
  end

  describe '#take_off' do
    let(:plane) { double :plane }

    it 'take off a plane' do
      allow(plane).to receive(:taken_off?).and_return(true)
      subject.land(plane)
      taken_off_plane = subject.take_off
      expect(taken_off_plane.taken_off?).to eq true
    end
  end

end
