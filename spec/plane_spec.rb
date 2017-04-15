require 'plane'

describe Plane do
  alias_method :plane, :subject

  describe '#land' do
    it 'lands plane' do
      plane.land
      expect(plane.landed).to be true
    end

    it 'confirms landing' do
      expect(subject).to receive(:confirm_landing)
      plane.land
    end

  end

  describe '#confirm_landing' do
    context 'plane has landed' do
      it 'returns message confirming plane has landed' do
        plane.land
        expect(subject.confirm_landing).to eq "This plane has landed."
      end
    end

    context 'plane has not landed' do
      it 'states plane has not landed if @landed = false' do
        expect(subject.confirm_landing).to eq "This plane has not landed."
      end
    end

  end

end
