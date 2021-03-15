require './lib/airport.rb'

RSpec.describe Airport do

it 'shows how many planes are at the airport' do
  airport = Airport.new

  expect(airport.planes_landed).to eq(1)
  end
end

  describe '#land' do 
    it 'to land a plane' do
    airport = Airport.new

    airport.land(1)

    expect { airport.land.to respond_to :land }
  end
  
  describe '#land' do 
    airport = Airport.new

    airport.land(1)

    it "says you can't land the airport is full" do
    expect(airport.land).to respond_to(@capacity)
  end

  describe 'full' do
    it "says the airport is full and won't allow any
    planes to land" do

    airport = Airport.new
    
    expect(airport.full).to eq(@capacity)

    airport.full
  end
end
end
end