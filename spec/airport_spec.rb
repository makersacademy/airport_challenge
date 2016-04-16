require 'airport'

describe Airport do
  let(:plane) { double(:plane, :landed => true) }

  describe '#land' do
    it 'accepts a plane to land' do
      subject.land(plane)
      expect{subject.land(plane)}.to raise_error 'Airport full'
    end
  end



end