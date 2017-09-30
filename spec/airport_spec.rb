require 'airport'
require 'aeroplane'

describe Airport do

  let(:subject)   {Airport.new}
  let(:plane)     {Aeroplane.new}

  describe 'take_off' do
    it 'allows a plane to take off and confirms it is no longer in the airport' do
      subject.take_off(plane)
      expect(plane.landed).to be false
    end
  end

  it 'allows a plane to land in the airport' do
     subject.land(plane)
     expect(plane.landed).to be true
  end

end
