require 'airport'

describe Airport do
  subject(:airport) {described_class.new}

  describe '#land' do
    let(:plane) {double(:plane)}

    it {is_expected.to respond_to(:land).with(1).argument}

    it 'lands the plane at the airport' do
      expect(airport.land(plane)).to include plane
    end

  end

  describe '#takeoff' do
    let(:plane) {double(:plane)}

    it {is_expected.to respond_to(:takeoff).with(1).argument}

    it 'removes the plane from the airport' do
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.planes_in_airport).not_to include(plane)
    end

  end



end
