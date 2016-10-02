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

  it 'can print how many planes are in the airport' do
    allow(subject).to receive(:stormy?).and_return(false)
    10.times {subject.land_plane(plane)}
    expect(subject.list).to eq subject.planes
  end

  describe '#land_plane' do

    it 'can confirm that 1 plane has landed' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land_plane(plane)
      expect(subject.planes.count).to eq 1
    end

    it 'can confirm that a plane has landed and is in it\'s slot' do
      allow(subject).to receive(:stormy?).and_return(false)
      expect(subject.land_plane(plane)).to eq subject.planes[-1]
    end

    it 'raises an error if airport is at capacity' do
      allow(subject).to receive(:stormy?).and_return(false)
      20.times {subject.land_plane(plane) }
      expect{ subject.land_plane(plane) }.to raise_error "Plane cannot land as airport is at capacity."
    end

    it 'does not allow a plane to land that has already landed' do
      allow(subject).to receive(:stormy?).and_return(false)
      current_plane = Plane.new
      subject.land_plane(current_plane)
      expect{ subject.land_plane(current_plane)}.to raise_error "This plane has already landed."
    end

    it 'raises an error if weather is stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect{ subject.land_plane(plane) }.to raise_error "Plane cannot land, it is too stormy."
    end
  end

  describe '#depart_plane' do
    it 'can confirm that 1 plane has taken off from it\'s current airport' do
      allow(subject).to receive(:stormy?).and_return(false)
      current_plane = Plane.new
      subject.land_plane(current_plane)
      expect( subject.depart_plane(current_plane) ). to eq subject.planes
    end

    it 'does not allow a plane to take-off that has already taken off' do
      allow(subject).to receive(:stormy?).and_return(false)
      current_plane = Plane.new
      current_plane.confirm_land
      subject.depart_plane(current_plane)
      expect{ subject.depart_plane(current_plane)}.to raise_error "This plane has already taken off."
    end

    it 'raises an error if weather is stormy' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land_plane(plane)
      allow(subject).to receive(:stormy?).and_return(true)
      expect{ subject.depart_plane(plane) }.to raise_error "Plane cannot take off, it is too stormy."
    end
  end
end
