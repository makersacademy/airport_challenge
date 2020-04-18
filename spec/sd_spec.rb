require 'sd'
require 'airport'

describe Sd do

  it 'responds to capacity(airport, capacity)' do
    expect(subject).to respond_to(:capacity).with(2).argument
  end

  it '.capacity returns postive integer' do
    sd = Sd.new
    airport = Airport.new
    capacity = 10
    expect(sd.capacity(airport, capacity)).to be_an(Integer)
    expect(sd.capacity(airport, capacity)).to be >= 0
#    expect(sd.capacity(airport, capacity)).to eq capacity
  end

end
