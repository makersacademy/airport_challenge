require 'airport'

describe Airport do
  describe '#land_plane' do
    it 'responds to landing plane' do
      expect(subject).to respond_to :land_plane
    end


    it 'it lands a plane' do
      plane = Plane.new
      expect(subject.land_plane(plane)).to eq [plane]
    end

    it "raises error when trying to land a plane into a full airport" do
      50.times { subject.land_plane Plane.new }
      expect{subject.land_plane(Plane.new)}.to raise_error("Airport is full")
    end
  end

  describe '#take_off' do
    it 'responds to take off' do
      expect(subject).to respond_to :take_off
    end

    it 'tells a plane to take off' do
      plane = Plane.new
      subject.land_plane(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'raises error when calling take off on an empty airport' do
      plane = Plane.new
      expect { subject.take_off(plane) }.to raise_error('There are no planes in the aiport')
    end
  end
end
