require 'plane'

describe Plane do
  context 'landed attr_accessor' do
    it 'can be called on a Plane' do
      expect(subject).to respond_to(:landed)
    end
  end
end