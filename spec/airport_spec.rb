require './lib/airport'

describe Airport do
  it "reports what is in the hangar when asked" do
    airport = Airport.new
    expect(airport.hangar).to eq airport.hangar
  end
end
