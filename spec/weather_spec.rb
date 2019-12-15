require 'weather'

describe Weather do
  it 'Says the weather at Luton is good' do
    luton = double("luton", :iata_code => :LTN)
    expect(subject.good_weather?(luton)).to eq true
  end
  it 'Says the weather at Heathrow is bad' do
    heathrow = double("heathrow", :iata_code => :LHR)
    expect(subject.good_weather?(heathrow)).to eq false
  end
end
