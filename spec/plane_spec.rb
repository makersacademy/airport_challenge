require 'plane'

describe Plane do

  before :each do
    @plane = Plane.new
  end

  describe '#flying?' do
    it 'returns the state of flight' do
      expect(@plane).to respond_to(:flying?)
    end

    it 'is flying at init' do
      expect(@plane.flying?).to eq(true)
    end

    it 'can be set to initialize as not flying' do
      expect(Plane.new(false).flying?).to eq(false)
    end
  end
end
