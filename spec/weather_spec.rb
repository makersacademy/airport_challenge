require 'weather'
require 'airport'

describe Weather do
  
  let(:airport) { Airport.new }
  it 'returns a random boolean' do
    expect(airport.stormy?).to eq(true).or(eq(false))
  end
end
