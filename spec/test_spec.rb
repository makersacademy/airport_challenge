require './lib/airport'
require './lib/plane.rb'

describe Airport do
    it { is_expected.to respond_to(:release_plane) }

    describe '.new' do
      context 'accepts 1 parameter' do
        it { expect { Airport.new(50) }.not_to raise_error }
      end
      context 'accepts no parameters' do
        it { expect(Airport.new.capacity).to eq(20) }
      end
    end

    describe 'release_plane' do
        it 'releases a plane' do
          plane = double(:plane)
          @storm = false
          subject.docking_plane(plane)
          expect(subject.release_plane).to eq plane
        end
    end
    
    describe '#release_plane' do
      it 'raises an error if no plane' do
        expect { subject.release_plane }.to raise_error 'No planes'
      end
      it 'accepts all planes' do
        plane = double(:plane)
        subject.docking_plane(plane)
        plane_two = double(:plane)
        subject.docking_plane(plane_two)
        expect(subject.planes.length).to eq(2)
      end
        it 'Do not release plane in storm' do
        plane = double(:plane)
        subject.docking_plane(plane)
        subject.in_storm
        expect { subject.release_plane }.to raise_error 'Cannot release plane in storm'
      end
    end

  describe '#docking_plane' do
    it { is_expected.to respond_to(:docking_plane).with(1).argument }
    it 'checks last plane is last plane when docked' do
      plane = double(:plane)
      subject.docking_plane(plane)
      planes = subject.planes
      expect(planes[-1]).to eq plane
    end
    it 'docks a plane with 2 parameters' do
      plane = double(:plane)
      allow(plane).to receive(:broken).and_return(true)
      subject.docking_plane(plane)
      expect(plane.broken).to eq(true)
    end
    it 'raises an error if no dock' do
      plane = double(:plane)
      Airport.new.capacity.times {subject.docking_plane(plane)}
      expect { subject.docking_plane (plane) }.to raise_error 'No space in dock'
    end
  end
end
