require 'airport'
describe Airport do
  it 'can create a new instance of airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end
end 