require './lib/airport.rb'

describe Airport do

  describe '#release_plane' do

    it 'responds to "release_plane"' do
      expect(subject).to respond_to :release_plane
    end

    it 'releases an instance of plane when method called with argument' do
      aeroplane = Plane.new
      expect(subject.release_plane(aeroplane)).to eq aeroplane
    end
  end

  describe '#accepts_plane' do

    it 'stores a plane when it is passed as an argument' do
      aeroplane = Plane.new
      expect(subject.accept_plane(aeroplane)).to eq [aeroplane]
    end
  end


end
