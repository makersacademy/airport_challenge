require 'airport'

describe Airport do
  plane = Plane.new
  describe '#landing' do
      it 'landing a plane in the airport' do
      should respond_to(:landing).with(1).argument
    end
    it 'confirm plane has landed' do
      expect(subject.landing(plane)).to eq(plane)
    end
  end
  describe '#releasing_plane' do
    it 'releasing a plane from the airport' do
      should respond_to(:releasing_plane)
    end
  end
end
