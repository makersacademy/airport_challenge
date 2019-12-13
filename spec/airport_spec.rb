require 'airport'

describe Airport do
  it 'creates an instance of Airport' do
    airport = Airport.new
    expect(airport).to be_a(Airport)
  end
end
