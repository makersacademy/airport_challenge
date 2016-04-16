require 'airport'

describe Airport do
  let(:plane) { double(:plane, :landed => true) }

  describe '#land' do
    it 'accepts a plane to land' do
      subject.land(plane)
      expect{ subject.land(plane) }.to raise_error 'Airport full'
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off' do
      subject.land(plane)
      subject.take_off
      expect{ subject.take_off }.to raise_error 'All planes have taken off'
    end
  end

end