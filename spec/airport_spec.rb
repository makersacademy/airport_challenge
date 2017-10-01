require 'airport'

class FakePlane


end

describe Airport do
  subject(:airport) { described_class.new }

  describe "#capacity" do
    it 'allows an airport capacity to be specified' do
      new_airport = Airport.new(airport.capacity + 1)
      expect(new_airport.capacity == airport.capacity + 1).to be true
    end
  end



end
