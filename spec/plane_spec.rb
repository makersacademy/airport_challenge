require "airport"
require 'plane'

describe Plane do
  describe '#landed?' do
    it 'should return true after land is called' do
      plane = Plane.new
      plane.land
      expect(plane.landed?).to eq true
    end

    it 'should not be landed on creation' do
      plane = Plane.new
      expect(plane.landed?).to eq false
    end
  end

  describe '#land' do
    it 'should change landed instance variable true' do
      plane = Plane.new
      expect(plane.land).to eq true
    end
  end
end
