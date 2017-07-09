require 'plane'

describe Plane do

  let(:plane) { Plane.new("Heathrow") }

  it 'in_airport should return true by default' do
    expect(plane).to respond_to(:in_airport?)
    expect(plane.in_airport?("Heathrow")).to eq true
  end

  it 'fly! to make in_airport? false, and land! to make in_airport? true' do
    expect(plane).to respond_to(:fly)
    plane.fly
    expect(plane.in_airport?("Heathrow")).to eq false
    expect(plane).to respond_to(:land_at)
    plane.land_at("Gatwick")
    expect(plane.in_airport?("Gatwick")).to eq true
  end

end
