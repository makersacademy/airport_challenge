require 'airport'

describe Airport do
  plane = Plane.new

  describe '#landing' do
      it 'landing a plane in the airport' do
      should respond_to(:landing).with(1).argument
    end
    it 'confirm plane has landed' do
      expect(subject.landing(plane)).to include(plane)
    end
  end
  describe '#release_plane' do
    it 'releasing a plane from the airport' do
      should respond_to(:release_plane)
    end
    it 'confirms the plane has been released' do
      subject.landing(plane)
      expect(subject.release_plane).to eq(plane)
    end
  end
end
