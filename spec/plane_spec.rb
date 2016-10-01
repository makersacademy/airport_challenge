require 'plane'

describe Plane do

  before :each do
    @plane = Plane.new
  end

  describe '#exists?' do
    it 'exists' do
      expect(@plane).to respond_to(:flying?)
    end
  end

  describe '#flying' do
    it 'allows changing of the flying var' do
      @plane.flying = false
      expect(@plane.flying).to eq false
    end
  end
end
