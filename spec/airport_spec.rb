require 'airport'

describe Airport do
  it { is_expected.to respond_to(:contains?).with(1).argument }
  let(:plane) { Plane.new }

  context 'when created' do
    context 'without being passed a capacity' do
      before { 100.times { Plane.new(subject) } }
      it 'should have a default capacity of 100' do
        expect { Plane.new(subject) }.to raise_error "Airport full"
      end
    end
  end

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
    context 'when given a plane initiated there' do
      let(:plane) { Plane.new(subject) }
      it 'should return true' do
        expect(subject.contains?(plane)).to be true
      end
    end
    context 'when given a plane intitiated in flight' do
      it 'should return false' do
        expect(subject.contains?(plane)).to be false
      end
    end
  end
end

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

  let(:airport) { Airport.new }

  context 'when a plane is created' do
    it 'should be flying by default' do
      expect(subject.flying?).to be true
    end
    context 'with a given airport' do
      context 'when the airport is not full' do
        let(:plane) { Plane.new(airport) }
        describe '@airport' do
          it 'should return the airport given at creation' do
            expect(plane.airport).to eq airport
          end
        end
      end
      context 'when the airport is full' do
        before { Plane.new(airport) until airport.full? }
        it 'should raise an airport full error' do
          expect { Plane.new(airport) }.to raise_error "Airport full"
        end
      end
    end
    context 'with something that is not an airport' do
      it 'raises an airport does not exist error' do
        expect { Plane.new("foo") }.to raise_error "Not a valid airport"
      end
    end
  end

  describe '#land' do
    context 'when a plane is already in an airport' do
      let(:grounded_plane) { Plane.new(airport) }
      it 'raises a can\'t land when in an airport error' do
        expect { grounded_plane.land(airport) }.to raise_error "Can't land when in an airport"
      end
    end
    context 'when an airport is given as argument' do
      context 'when the airport is not full' do
        it 'returns the plane that just landed' do
          expect(subject.land(airport)).to eq subject
        end
        describe '@airport' do
          before { subject.land(airport) }
          it 'should be the airport just passed' do
            expect(subject.airport).to eq airport
          end
        end
      end
      context 'when the airport is full' do
        before { Plane.new(airport) until airport.full? }
        it 'should raise an airport full error' do
          expect { subject.land(airport) }.to raise_error "Airport full"
        end
      end
    end
    context 'when a non-airport is given as an argument' do
      it 'raises an airport does not exist error' do
        expect { subject.land("foo") }.to raise_error "Not a valid airport"
      end
    end
    context 'when nil is given as an argument' do
      it 'raises an airport does not exist error' do
        expect { subject.land(nil) }.to raise_error "Not a valid airport"
      end
    end
  end

  describe '#take_off' do
    context 'when passed a plane in an airport' do
      let(:plane) { Plane.new(airport) }
      it 'should return a string confirming take off' do
        expect(plane.take_off).to eq "#{plane} has taken off from #{airport}"
      end
      it 'should remove the plane from the airport' do
        plane.take_off
        expect(airport.contains?(plane)).to be false
      end
      it 'should be flying' do
        plane.take_off
        expect(plane.flying?).to be true
      end
    end
    context 'when passed a plane not in an airport' do
      it 'should raise a can\'t take off when not in airport error' do
        expect { subject.take_off }.to raise_error "Can't take off when not in airport"
      end
    end
  end
end
