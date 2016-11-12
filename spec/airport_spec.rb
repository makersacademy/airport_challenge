require './lib/airport'

describe Airport do

  let(:plane) { double :plane }
  let(:weather) { double :weather }

  context 'landing a plane' do

    before(:each) { allow_any_instance_of(Weather).to receive(:stormy?).and_return false }

    it { is_expected.to respond_to :land_plane }

    it 'creating an airport should create space for planes' do
      expect(subject.planes).to eq []
    end

    it 'instructs a plane to land' do
      allow(plane).to receive(:land_plane).and_return(plane)
      subject.land_plane(plane)
    end

    it 'has the plane after landing' do
      subject.land_plane(plane)
      expect(subject.planes).to eq [plane]
    end

  end

  context 'confirming plane has landed' do

    before(:each) { allow_any_instance_of(Weather).to receive(:stormy?).and_return false }

    it { is_expected.to respond_to :confirm_plane_landing }

    it 'should confirm plane has landed once plane has landed' do
      expect(subject.land_plane(plane)).to eq "Plane #{plane} has landed"
    end

  end

  context 'plane taking off' do

    before(:each) { allow_any_instance_of(Weather).to receive(:stormy?).and_return false }

    it { is_expected.to respond_to :take_off_plane }

    it 'instructs a plane to take off' do
      allow(plane).to receive(:take_off_plane)
      subject.take_off_plane(plane)
    end

    it 'does not have the plane after take off' do
      subject.land_plane(plane)
      subject.take_off_plane(plane)
      expect(subject.planes).not_to include plane
    end

    it 'has one less plane in the airport after take off' do
      subject.land_plane(plane)
      subject.take_off_plane(plane)
      expect(subject.planes.length).to eq 0
    end

  end

  context 'confirm plane has taken off' do

    before(:each) { allow_any_instance_of(Weather).to receive(:stormy?).and_return false }

    it { is_expected.to respond_to :confirm_plane_take_off }

    it 'should confirm that plane has taken off' do
      subject.land_plane(plane)
      expect(subject.take_off_plane(plane)).to eq "Plane #{plane} has taken off"
    end

  end

  context 'stormy weather' do

    it 'does not allow for landing if stormy' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return true
      expect {subject.land_plane(plane)}.to raise_error
    end

    it 'allows for landing if not stormy' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return false
      expect {subject.land_plane(plane)}.not_to raise_error
    end

    it 'does not allow for take off if stormy' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return true
      expect {subject.take_off_plane(plane)}.to raise_error
    end

    it 'allows for take off if not stormy' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return false
      expect {subject.take_off_plane(plane)}.not_to raise_error
    end

  end

  context 'capacity' do

    before(:each) { allow_any_instance_of(Weather).to receive(:stormy?).and_return false }

    it 'can set a capacity for an airport' do
      expect(subject.total_capacity).not_to be_nil
    end

    it 'is created with a default capacity' do
      expect(subject.total_capacity).to eq 10
    end

    it 'can accept a required capacity' do
      airport = Airport.new(25)
      expect(airport.total_capacity).to eq 25
    end

    it 'can identify when airport is full' do
      10.times { subject.land_plane(plane) }
      expect(subject.full?).to eq true
    end

    it 'can identify when airport is not full' do
      expect(subject.full?).to eq false
    end

    it 'prevents landing when airport is full' do
      10.times { subject.land_plane(plane) }
      expect { subject.land_plane(plane) }.to raise_error
    end

  end



end
