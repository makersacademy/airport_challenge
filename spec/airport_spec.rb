require 'airport'

describe Airport do

  describe 'Plane tests' do
    before do
      subject.make_plane
    end

    it 'creates a plane' do
      expect(subject.plane).to be_a_kind_of Plane
    end

    it 'check plane is working' do
      expect(subject.plane).to respond_to(:working?)
    end
  end

  describe '#land_plane' do
    before do
      subject.make_plane
      subject.land_plane
      subject.make_plane
      subject.land_plane
    end

    it 'hangar receives a plane' do
      expect(subject.hangar).not_to be_empty
    end

    it 'throws error if hangar is full' do
      subject.make_plane
      expect { subject.land_plane }.to raise_error 'No space in hangar'
    end
  end

  describe '#take_off' do
    before do
      subject.land_plane
      subject.take_off
    end

    it 'removes plane from hangar' do
      expect(subject.hangar).to be_empty
    end

    it 'confirms no plane in hangar' do
      expect(subject.take_off).to eq("No planes in hangar")
    end
  end

end

# describe Plane do

# end

