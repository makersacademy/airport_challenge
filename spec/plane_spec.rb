require 'plane'

RSpec.describe Plane do

  subject(:plane) { described_class.new }

  context 'when flying' do

    before(:each) do
      @flying_plane = described_class.new(:flying)
    end
    
    it 'should land at an airport' do
      expect(@flying_plane.land).to be :grounded
    end

    it 'should not be able to take off' do
      expect { @flying_plane.take_off }.to raise_error 'Plane is already flying'
    end
  
  end

  context 'when grounded' do
    
    it 'should take off from an airport' do
      expect(plane.take_off).to be :flying
    end

    it 'should not be able to land' do
      expect { plane.land }.to raise_error 'Plane is already grounded'
    end

  end

end
