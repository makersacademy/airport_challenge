require 'airport'

describe Airport do

  subject(:airport) { Airport.new }

  let(:plane) { double('plane') }

  describe 'airport deals with landings' do
    it 'checks plane in after landing request' do
      airport.request("landing", plane)
      expect(airport.grounded_planes).to include plane
    end

    it 'confirms landing' do
      expect { airport.request("landing", plane) }.to output("Plane landed.\n").to_stdout
    end
  end

end
