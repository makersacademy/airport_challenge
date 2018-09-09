require 'plane'

RSpec.describe Plane do

  subject(:plane) { Plane.new }

  context 'when flying' do

    it 'should land at an airport' do
      expect(plane.land).to be :grounded
    end

    it 'should not be able to take off' do
      flying_plane = Plane.new(:flying)
      expect { flying_plane.take_off }.to raise_error 'Plane is already flying'
    end
  
  end

  it 'should take off from an airport' do
    expect(plane.take_off).to be :flying
  end

end
