require 'airport'

describe Airport do
  it 'responds to a plane' do
    airport = Airport.new
    expect(airport.landing("plane1")).to eq("plane1")
  end

  it 'takes off from airport' do
    puts "-----"
    airport = Airport.new
    airport.landing("plane")
    x = airport.at_airport.length
    puts x
    if x > 0
      expect(airport.takeoff).to eq(x - 1)
    else
      fail "No planes at airport"
    end
  end

  it 'ground planes when stormy' do
    puts "-----"
  end

end
