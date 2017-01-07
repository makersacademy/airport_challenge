require 'airport'

describe Airport do
  myPlane = Plane.new
  describe '#landing airplane' do
      it 'landing a plane in the airport' do
      should respond_to(:landing).with(1).argument
    end
    it 'confirm plane has landed' do
      expect(subject.landing(myPlane)).to eq(myPlane)
    end
  end
end
