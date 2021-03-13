require 'plane'

describe Plane do

  let(:plane) { Plane.new }

  describe '#flying' do
    it 'returns whether the plane is flying' do
      expect(plane.flying).to eq(true)
    end
  end
 
end
