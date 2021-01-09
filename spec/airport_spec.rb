require 'airport'

describe Airport do
  it { is_expected.to respond_to(:contains?).with(1).argument }
  let(:plane) { Plane.new }

  describe '#contains?' do
    context 'when given a plane that has landed there' do
      before { plane.land(subject) }
      it 'should return true' do
        expect(subject.contains?(plane)).to eq true
      end
    end
    context 'when given a plane that has not landed there' do
      it 'should return false' do
        expect(subject.contains?(plane)).to eq false
      end
    end
  end
end

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

  describe '@airport' do
    context 'when a plane is created' do
      it 'should default to nil' do
        expect(subject.airport).to be_nil
      end
      context 'with a given airport' do
        let(:airport) { Airport.new }
        let(:plane) { Plane.new(airport) }
        it 'should return the airport given at creation' do
          expect(plane.airport).to eq airport
        end
      end
      context 'with something that is not an airport' do
        it 'should raise an airport does not exist error' do
          expect { Plane.new("foo") }.to raise_error "Not a valid airport"
        end
      end
    end

  end

  let(:airport) { Airport.new }

  describe '#land' do
    context 'when an airport is given as argument' do
      it 'returns the plane that just landed' do
        expect(subject.land(airport)).to eq subject
      end
    end
  end

  # describe '#take_off' do
  #   it 'returns the airport just taken off from' do
  #   before { subject.land(airport) }
  #   # expect(subject.)
  # end

end
