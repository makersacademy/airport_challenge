require 'airport'
describe Airport do

  # test described in Step 04 in the README
  it "has a default capacity of 20" do
    airport = Airport.new
    expect(airport.capacity).to eq 20
  end

  # test described in Step 05 in the README
  it "can take an override capacity" do
    airport = Airport.new(55)
    expect(airport.capacity).to eq 55
  end

end
