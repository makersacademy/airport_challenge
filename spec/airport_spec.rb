require 'airport'

describe Airport do

  describe '#land' do
    it 'allows planes to land' do
      expect(subject.land(:plane)).to eq [:plane]
    end
  end

end
