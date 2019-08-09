require 'airport'
describe Airport do
  it 'can create an instance of a airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end
end 
