require 'airport'

describe Airport do
  it { is_expected.to respond_to(:contains?).with(1).argument }
  it { is_expected.to respond_to(:change_capacity).with(1).argument }
  it { is_expected.to respond_to :stormy? }

  let(:plane) { Plane.new }

  context 'when created' do
    context 'without being passed a capacity' do
      before { 100.times { Plane.new(subject) } }
      it 'should have a default capacity of 100' do
        expect { Plane.new(subject) }.to raise_error "Airport full"
      end
    end
    context 'when passed a different capacity' do
      let(:big_airport) { Airport.new(250) }
      it 'should be able to hold that many planes' do
        expect { 250.times { Plane.new(big_airport) } }.not_to raise_error
      end
      it 'should not be able to hold more than that number' do
        expect { (250 + 1).times { Plane.new(big_airport) } }.to raise_error "Airport full"
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

  describe '#change_capacity' do
    context 'when passed a capacity larger than the number of planes stored' do
      before { subject.change_capacity(250) }
      it 'should be able to hold that many planes' do
        expect { 250.times { Plane.new(subject) } }.not_to raise_error
      end
      it 'should not be able to hold more than that number' do
        expect { (250 + 1).times { Plane.new(subject) } }.to raise_error "Airport full"
      end
    end
    context 'when passed a capacity less than the number of stored planes' do
      before { 60.times { Plane.new(subject) } }
      it 'should raise a can\'t reduce capacity below current usage error' do
        expect { subject.change_capacity(50) }.to raise_error "Can't reduce capacity below current usage"
      end
    end
    context 'when passed a non-integer number' do
      it 'should raise a must be integer error' do
        expect { subject.change_capacity(2.5) }.to raise_error "Must be an integer"
      end
    end
  end

  describe '#stormy?' do
    it 'should be either true or false' do
      expect(subject.stormy?).to be(true).or be false
    end
    context 'when called many times' do
      let(:results) { [] }
      before { 100_000.times { results << subject.stormy? } }
      it 'should contain both true and false' do
        expect(results).to include(true).and include false
      end
      it 'should be false much more often than true' do
        expect(results.count(false)).to be > results.count(true) * 2
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
      let(:plane) { Plane.new(airport) }
      context 'when the airport is not full' do
        describe '@airport' do
          it 'should return the airport given at creation' do
            expect(plane.airport).to eq airport
          end
        end
      end
      context 'when the airport is full' do
        before { allow(airport).to receive(:full?) { true } }
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
        context 'when the weather at the chosen airport is not stormy' do
          before { allow(airport).to receive(:stormy?) { false } }
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
        context 'when the weather at the chosen airport is stormy' do
          before { allow(airport).to receive(:stormy?) { true } }
          it 'should raise a can\'t land when stormy error' do
            expect { subject.land(airport) }.to raise_error "Can't land when stormy"
          end
        end
      end
      context 'when the airport is full' do
        before { allow(airport).to receive(:full?) { true } }
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
      context 'when the weather at the airport is not stormy' do
        before { allow(airport).to receive(:stormy?) { false } }
        it 'should return a string confirming take off' do
          expect(plane.take_off).to eq "#{plane} has taken off from #{airport}"
        end
        context 'when the plane has taken off' do
          before { plane.take_off }
          it 'should not be contained in the airport' do
            expect(airport.contains?(plane)).to be false
          end
          it 'should be flying' do
            expect(plane.flying?).to be true
          end
        end
      end
      context 'when the weather at the airport is stormy' do
        before { allow(airport).to receive(:stormy?) { true } }
        it 'should raise a can\'t take off when weather is stormy error' do
          expect { plane.take_off }.to raise_error "Can't take off when weather is stormy"
        end
      end
    end
    context 'when passed a plane not in an airport' do
      it 'should raise a can\'t take off when not in airport error' do
        expect { subject.take_off }.to raise_error "Can't take off when not in airport"
      end
    end
  end
end

describe Weather do
  it { is_expected.to respond_to :check }

  describe '#check' do
    it 'should return either sunny or stormy' do
      expect(subject.check).to eq('sunny').or eq 'stormy'
    end
    context 'when run many times' do
      let(:results) { [] }
      before { 100_000.times { results << subject.check } }
      it 'should change between sunny and stormy' do
        expect(results).to include('sunny').and include 'stormy'
      end
      it 'should be sunny much more often than stormy' do
        expect(results.count('sunny')).to be > results.count('stormy') * 2
      end
    end
  end
end
