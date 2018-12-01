require 'airport'

describe Airport do
  subject(:airport) { Airport.new }

  describe '#land' do
    it 'responds to .land(plane)' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'expects .land to not return nil' do
      plane = Airport.new.land(plane)
      expect { plane.should_not be_nil }
    end
  end

  describe '#release' do
    it 'responds to .release(plane)' do
      expect(airport).to respond_to(:release).with(1).argument
    end

    it 'expects .release to not return nil' do
      plane = Airport.new.release(plane)
      expect { plane.should_not be_nil }
    end
  end
end
