require 'airport'

describe Airport do
  it 'creates an instance of Airports' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end
end
