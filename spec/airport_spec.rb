require 'airport'
require 'weather'

describe Airport do

  let(:flying_plane) { double(:plane, land: true) }
  let(:landed_plane) { double(:plane, fly: true) }

  describe '#new' do
    it 'Checks capacity can be changed' do
      expect(Airport.new(3).capacity).to eq 3
    end

    it 'Can use default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  context 'When the weather is fine' do
      before(:each) do
        allow(subject).to receive(:stormy?).and_return(false)
      end
      describe 'Landing tests' do
        it 'instructs the plane to land' do
          expect(flying_plane).to receive(:land)
          subject.land flying_plane
        end
        it 'checks the plane has landed' do
          subject.land (flying_plane)
          expect(subject.planes).to include flying_plane
        end
        it 'prevents landing when the airport is full' do
          subject.capacity.times {subject.land(flying_plane)}
          expect{subject.land(flying_plane)}.to raise_error 'airport full'
        end
      end

      describe 'Take off tests' do
        it 'instructs plane to take off' do
          expect(landed_plane).to receive(:fly)
          subject.take_off landed_plane
        end
        it 'confirms plane has taken off' do
          subject.land(flying_plane)
          subject.take_off(landed_plane)
          expect(subject.planes).not_to include landed_plane
        end
        it 'errors if you try to take off plane not in airport' do
          two = Airport.new
          two.land(flying_plane)
          expect{subject.take_off(landed_plane)}.to raise_error 'plane not in airport'
        end
      end
  end

  context 'When the weather is stormy' do
    before(:each) do
      allow(subject).to receive(:stormy?).and_return(true)
    end

    describe 'Landing tests' do
      it 'prevents landing when weather is stormy ' do
        expect{subject.land(flying_plane)}.to raise_error 'stormy weather'
      end
    end
    describe 'Take off tests' do
      it 'prevents takeoff when weather is stormy ' do
        expect{subject.take_off(landed_plane)}.to raise_error 'stormy weather'
      end
    end
  end
end
