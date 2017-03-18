require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land(plane)' do
    it 'lands planes' do
      plane = double :plane
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#take_off(plane)' do
    let (:plane) { double :plane}
    it 'takes-off planes' do
      plane = double :plane
      allow(plane).to receive(:left?).and_return(true)
      subject.land(plane)
      taken_off = subject.take_off
      expect(taken_off).to be_left
    end
  end


end
