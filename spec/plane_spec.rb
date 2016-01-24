require 'plane.rb'

describe 'airplane' do

  before(:example) do
    @airplane = Plane.new
  end

  describe 'flying' do
    it 'Plane takes off' do
      @airplane.land
      @airplane.take_off
      expect(@airplane.flying).to eq(true)
    end

    it 'flying to assign true' do
      expect(@airplane.flying).to eq(true)
    end
  end

  describe 'landing' do
    it 'plane lands' do
      @airplane.land
      expect(@airplane.flying).to eq(false)
    end
  end
end
