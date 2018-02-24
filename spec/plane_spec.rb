require 'plane'

describe Plane do
  describe '#land' do
    it 'should land a plane' do
      expect(subject).to respond_to :land
    end
  end

end
