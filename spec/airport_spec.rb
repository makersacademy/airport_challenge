require 'airport'

describe Airport do
  it 'can create an instance of Airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end
end