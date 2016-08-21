require 'airport'

describe Airport do

  describe 'land(plane)' do
    it 'lands a plane' do
      plane = double(:plane)
      expect(subject.land(plane)).to eq plane
    end
  end

end
