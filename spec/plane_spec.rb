
require 'plane'

describe Plane do

  subject(:plane) { described_class.new }
  context 'initial settings' do
    it {should respond_to :land}
    it {should respond_to :take_off}
    it {should_not be_flying }
  end

  context 'when flying' do
    it 'is flying' do
      plane.take_off
      expect(plane).to be_flying
    end
  end
  context 'when landed' do
    it 'is landed' do
      plane.take_off
      plane.land
      expect(plane).not_to be_flying
    end
  end
end
