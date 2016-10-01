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
end
