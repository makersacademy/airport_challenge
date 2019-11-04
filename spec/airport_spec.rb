require 'airport'
describe Airport do

  it 'can create and instance of an airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end

end
