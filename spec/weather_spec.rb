require 'weather'
require 'airport'

describe Weather do

  let(:airport) { airport = Airport.new }

  it 'returns #stormy? as true when 6 is selected when #rand outputs 6 from the numbers 1 to 6' do
    allow(airport).to receive(:rand) { 6 }
    expect(airport.stormy?).to eq true
  end

  it 'returns #stormy? as false when 1 is selected when #rand outputs 1 from numbers 1 to 6' do
    allow(airport).to receive(:rand) { 1 }
    expect(airport.stormy?).to eq false
  end

end
