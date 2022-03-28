require_relative '../lib/plane'

describe 'Airport simulation' do
  it 'lands multiple planes' do
    heathrow = Airport.new
    boeing747 = Plane.new
    a380 = Plane.new
    srand 5
    boeing747.land(heathrow)
    srand 9
    a380.land(heathrow)
    expect(heathrow.hangar).to eq [boeing747, a380]
  end

  it 'takes off multiple planes' do
    manchester = Airport.new(29)
    boeing747 = Plane.new
    a380 = Plane.new
    srand 5
    boeing747.land(manchester)
    srand 9
    a380.land(manchester)
    srand 2
    boeing747.take_off(manchester)
    srand 4
    a380.take_off(manchester)
    expect(manchester.hangar).to eq []
  end
end
