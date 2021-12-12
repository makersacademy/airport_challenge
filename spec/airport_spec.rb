require 'airport'

describe Airport do
  airport = Airport.new
  it { is_expected.to respond_to(:capacity) }
  it { is_expected.to respond_to(:change_capacity) }

  it "checks airport default capacity after airport initialized" do
    expect(airport.capacity).to eq 1
  end

  it "edits airport capacity" do
    airport.change_capacity(2)
    expect(airport.capacity).to eq 2
  end
  
end
