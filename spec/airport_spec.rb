require 'airport'
require 'plane'
require 'weather'

describe Airport do

  subject(:airport) { described_class.new }

  describe "#planes_in airport" do

    let(:plane) { double('plane') }

  it 'stores a landed plane in the airport capacity' do

    airport.planes_in_airport = [plane, plane]
    expect(airport.planes_in_airport).to contain_exactly(plane, plane)

  end
end



end
