
require 'plane'

describe Plane do
  context 'initial settings' do
    it {should respond_to :flying?}
    it {should respond_to(:flying=).with(1).argument}
    it {should_not be_flying }
  end

  context 'when flying' do
    it 'is flying' do
      plane = Plane.new
      plane.flying = true
      expect(plane).to be_flying
    end
  end
  context 'when landed' do
    it 'is landed' do
      plane = Plane.new
      plane.flying = false
      expect(plane).not_to be_flying
    end
  end
end
