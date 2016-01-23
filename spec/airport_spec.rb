require 'airport'

describe Airport do

  describe '#land' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'check if plane has landed' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(plane.landed?).to eq true
    end
  end

end
