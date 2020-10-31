require 'plane'

describe Plane do
  context '#land' do
    it 'can be called on a Plane' do
      expect(subject).to respond_to(:land)
    end
  end
end