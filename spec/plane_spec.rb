require 'plane'

describe Plane do
  alias_method :plane, :subject

  describe '#land' do
    it 'lands plane' do
      plane.land
      expect(plane.landed).to be true
    end

    it 'confirms landing' do
      expect(plane).to receive(:confirm_landing)
      plane.land
    end

  end

  describe '#confirm_landing' do
    context 'plane has landed' do
      it 'returns message confirming plane has landed' do
        plane.land
        expect(plane.confirm_landing).to eq "This plane has landed."
      end
    end

    context 'plane has not landed' do
      it 'states plane has not landed if @landed == false' do
        expect(plane.confirm_landing).to eq "This plane has not landed."
      end
    end

  end

  describe '#take_off' do
    it 'makes plane take off' do
      plane.take_off
      expect(plane.landed).to be false
    end

    it 'confirms take-off' do
      expect(plane).to receive(:confirm_take_off)
      plane.take_off
    end
  end

  describe '#confirm_take_off' do
    context 'plane has taken off' do
      it 'returns message confirming plane has taken off' do
        plane.take_off
        expect(plane.confirm_take_off).to eq "This plane is in the air."
      end
    end
  end

end
