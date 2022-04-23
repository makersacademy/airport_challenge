require './docs/airport_challenge'
describe Airport do
  it 'can create an instance of airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end
  
end
