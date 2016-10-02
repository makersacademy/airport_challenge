require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  let(:plane) { double }
  before do
    allow(plane).to receive_messages(
    :landed? => false,
    :confirm_land => true,
    :confirm_takeoff => false)
  end

  context 'sunny weather' do
    before do
      allow(subject).to receive(:stormy?).and_return(false)
    end
    describe '#land_plane' do
      
      it 'can confirm that 1 plane has landed' do
        subject.land_plane(plane)
        expect(subject.planes.count).to eq 1
      end

      it 'can confirm that a plane has landed and is in it\'s slot' do
        expect(subject.land_plane(plane)).to eq subject.planes[-1]
      end

      it 'raises an error if airport is at capacity' do
        20.times {subject.land_plane(plane) }
        message = "Plane cannot land as airport is at capacity."
        expect{ subject.land_plane(plane) }.to raise_error message
      end

      it 'does not allow a plane to land that has already landed' do
        current_plane = Plane.new
        subject.land_plane(current_plane)
        message = "This plane has already landed."
        expect{ subject.land_plane(current_plane)}.to raise_error message
      end
    end
    describe '#depart_plane' do

      it 'can confirm that 1 plane has taken off from it\'s current airport' do
        current_plane = Plane.new
        subject.land_plane(current_plane)
        subject.depart_plane(current_plane)
        expect( subject.planes.include?(current_plane) ). to eq false
      end

      it 'does not allow a plane to take-off that has already taken off' do
        current_plane = Plane.new
        subject.land_plane(current_plane)
        subject.depart_plane(current_plane)
        message = "This plane has already taken off."
        expect{ subject.depart_plane(current_plane)}.to raise_error message
      end

      it 'raises an error when a plane attempts to depart from the wrong airport' do
        airport_one = Airport.new
        allow(airport_one).to receive(:stormy?).and_return(false)
        airport_two = Airport.new
        allow(airport_two).to receive(:stormy?).and_return(false)
        plane_one = Plane.new
        airport_one.land_plane(plane_one)
        message = "This plane cannot depart from this airport."
        expect{ airport_two.depart_plane(plane_one) }.to raise_error message
      end
    end
  end

  context 'stormy weather' do
    it 'raises an error if plane wants to land in stormy weather' do
      allow(subject).to receive(:stormy?).and_return(true)
      message = "Plane cannot land, it is too stormy."
      expect{ subject.land_plane(plane) }.to raise_error message
    end
    it 'raises an error if plane wants to depart in stormy weather' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land_plane(plane)
      allow(subject).to receive(:stormy?).and_return(true)
      message = "Plane cannot take off, it is too stormy."
      expect{ subject.depart_plane(plane) }.to raise_error message
    end
  end

  describe '#list' do
    before do
      allow(subject).to receive(:stormy?).and_return(false)
    end
    before do
      3.times do
        subject.land_plane(plane)
      end
    end
    it 'produces a list of planes in the current airport' do
      expect(subject.list).to eq subject.planes
    end
  end
end
