require 'airport'

describe Airport do
  it 'should create an aiport object'
  describe '#land' do
    it 'land the plane at the airport' do
      expect(subject.land).to eq("Plane has landed safely!")
    end
  end
end
