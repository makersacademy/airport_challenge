require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double(:Airport) }

  describe '#land' do
    it 'lands only when flying' do
      plane.land airport
      message = "Already landed!"
      expect{plane.land airport}.to raise_error message
    end
  end

  describe '#landed?' do
    it 'displays that it has landed when at an airport' do
      plane.land airport
      expect(plane).to be_landed
    end
  end

  describe '#take_off' do
    it 'leaves only when commanded by relevant airport' do
      plane.land airport
      message = "Wrong airport giving instructions"
      expect{plane.take_off 'somewhere_else'}.to raise_error message
    end

    it 'is no longer at an airport' do
      plane.land airport
      plane.take_off airport
      expect(plane).not_to be_landed
    end
  end
end
