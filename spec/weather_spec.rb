require 'weather'

describe Weather do
  it 'Says the weather at Luton is good' do
    gatwick = double("gatwick", :iata_code => :LGW)
    # Seed rand so that rand(3) eq 2, seed number will require updating with additional airports added
    srand(Weather::AVAILABLE_AIRPORTS.length + 1)
    expect(subject.good_weather?(gatwick)).to eq true
  end

  it 'Says the weather at Heathrow is bad' do
    heathrow = double("heathrow", :iata_code => :LHR)
    srand(Weather::AVAILABLE_AIRPORTS.length + 1)
    expect(subject.good_weather?(heathrow)).to eq false
  end
end
