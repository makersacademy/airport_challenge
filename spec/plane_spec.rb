require 'plane'

describe Plane do

  describe '#land' do

    it 'lands at an airport' do
      fk_airport = double(:plane_arrived)
      expect(fk_airport).to receive :plane_arrived
      subject.land(fk_airport)
    end

  end

  describe '#takeoff' do

    it 'takes off from an aiport' do
      fk_airport = double(:plane_departed)
      expect(fk_airport).to receive :plane_departed
      subject.takeoff(fk_airport)
    end

  end

end
