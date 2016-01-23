
require 'weather'
require 'airport'

describe Weather do

  before(:example) do
    @airport = Airport.new("luton")
  end

  it 'stormy is true or false' do
    expect(@airport.stormy?).to eq(true) | eq(false)
  end
end
