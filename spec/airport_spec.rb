require 'airport'

describe Airport do
  it 'responds to a plane' do
    airport = Airport.new
    expect(airport.landing("plane")).to eq("plane")
  end
end
