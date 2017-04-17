require 'plane'

describe Plane do
  alias_method :plane, :subject

  describe '#land' do
    it 'lands plane' do
      plane.land
      expect(plane.landed).to be true
    end

    context 'plane has already landed' do
      it 'raises error' do
        plane.land
        expect { plane.land }.to raise_error "Error: Plane is already on the ground."
      end
    end

  end

  describe '#confirm_landing' do
    context 'plane has landed' do
      it 'returns message confirming plane has landed' do
        plane.land
        expect(plane.confirm_landing).to eq "Plane has landed."
      end
    end

    context 'plane has not landed' do
      it 'states plane has not landed' do
        expect(plane.confirm_landing).to eq "Plane has not landed."
      end
    end

  end

  describe '#take_off' do
    it 'makes plane take off' do
      plane.take_off
      expect(plane.landed).to be false
    end

    it 'runs method to confirm take off' do
      expect(plane).to receive(:confirm_take_off)
      plane.take_off
    end
  end

  describe '#confirm_take_off' do
    context 'plane has taken off' do
      it 'returns message confirming plane has taken off' do
        plane.take_off
        expect(plane.confirm_take_off).to eq "Plane is in the air."
      end
    end

    context 'plane has not taken off' do
      it 'reports that plane has not taken off' do
        plane.land
        expect(plane.confirm_take_off).to eq "Plane has not taken off."
      end
    end

  end
    

end
