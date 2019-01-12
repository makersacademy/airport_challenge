require 'airport'

RSpec.describe Airport do

  describe '#land' do
  it 'allows planes to land' do
  Heathrow = Airport.new
  plane1 = Plane.new
  expect(Heathrow.land(plane1)).to eq [plane1]
end
end

  describe '#take_off' do
    it 'allows planes to take off' do
      Heathrow = Airport.new
      plane1 = Plane.new
      Heathrow.land(plane1)
      expect(Heathrow.take_off(plane1)). to eq plane1
    end
  end

end
