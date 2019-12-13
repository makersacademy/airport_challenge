require './lib/airport'

describe Airport do

  it 'can create an airport' do
    expect(Airport.new).to be_a Airport
  end
end
