require 'airport'

describe Airport do
  describe '#land_plane' do
    it 'responds to landing plane' do
      expect(subject).to respond_to :land_plane
    end

    it 'it lands a plane' do
      plane = Plane.new
      expect(subject.land_plane(plane)).to eq plane
    end
  end

  describe '#take_off' do
    it 'responds to take off' do
      expect(subject).to respond_to :take_off
    end

    it 'tells a plane to take off' do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq plane
    end
  end
end 
