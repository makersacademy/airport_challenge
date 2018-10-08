require_relative '../lib/airport.rb'

describe Airport do
  let(:plane) { double(:plane) }

  it 'has a default capacity of 1' do
    airport = Airport.new("airport")
    airport.hanger.push(plane)
    expect(airport.full?).to eq true
  end

  it 'can have a capacity specified' do
    airport = Airport.new("airport", 2)
    airport.hanger.push(plane)
    airport.hanger.push(plane)
    expect(airport.full?).to eq true
  end
end
