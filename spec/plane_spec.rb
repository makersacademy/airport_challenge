require 'plane'

describe 'Plane' do
  describe '#land' do
    it 'lands a plane at an airport' do
      expect(Plane.new).to respond_to :land 
    end
  end
end
