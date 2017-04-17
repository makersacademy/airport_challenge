require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to(:planes) }

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it 'lands plane' do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
  end

  describe '#takeoff' do
    let(:plane) { double :plane }
    it 'tells plane to take off' do
      subject.takeoff
      expect(subject.planes).not_to include(plane)
    end
  end
end
