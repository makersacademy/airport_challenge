require 'sd'
require 'airport'

describe Sd do

  it 'responds to capacity(airport, capacity)' do
    expect(subject).to respond_to(:capacity).with(2).argument
  end

  it '.capacity returns integer' do
    sd = Sd.new
    airport = Airport.new
    expect(sd.capacity(airport, 10)).to be_an(Integer) 
  end

end
