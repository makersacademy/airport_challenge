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
      expect(airport.takeoff("plane")).to eq(x - 1)
    else
      fail "No planes at airport"
    end
  end

  it 'cannot takeoff when stormy' do
    puts "-----"
    airport = Airport.new
    airport.landing("plane333")
    airport.stormy
    if airport.stormy == true
      expect(airport.takeoff("plane333")).to eq("Too stormy!")
    end
    puts airport.takeoff("plane333")

  end

  it "cannot land when stormy" do
    puts "-----"
    airport = Airport.new
    airport.stormy
    if airport.stormy == true
      expect(airport.landing("plane123")).to eq("Too stormy!")
    end
    puts airport.landing("plane123")
  end

  it 'cannot land when full' do
    puts "-----"
    airport = Airport.new
    if airport.at_airport.length == :capacity
      expect(airport.landing("plane345")).to eq("Airport is full")
    end
    puts airport.landing("plane345")
  end

end
