require 'airport'
require 'plane'

describe Airport do
let (:plane) { double( :plane ) }
  describe '#lands_planes' do
    it { is_expected.to respond_to(:lands_plane).with(1).argument }
    it 'returns the value of the plane which has landed' do
      plane = double( 'plane', :lands_plane => plane)
      expect(subject.lands_plane(plane)).to eq "#{plane} has landed"
    end
    it 'adds the plane to the plans array' do
      plane = double( 'plane')
      subject.lands_plane(plane)
      expect(subject.planes).to eq [plane]
    end
  end
  describe '#planes' do
    it { is_expected.to respond_to(:planes) }
  end
  describe '#takes_off' do
    it { is_expected.to respond_to(:takes_off)}
    it 'returns the value of the plane which has taken off' do
      plane = double( 'plane')
      subject.lands_plane(plane)
      expect(subject.takes_off).to eq "#{plane} has taken off"
    end
    it 'removes the plane to the plans array' do
      plane = double( 'plane', :lands_plane => plane)
      subject.takes_off
      expect(subject.planes).to eq []
    end
  end
end
