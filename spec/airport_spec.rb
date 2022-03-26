require_relative '../lib/airport'

describe Airport do
  let(:heathrow) { Airport.new }
  let(:manchester) { Airport.new(29) }

  it 'has a hangar to store planes' do
    expect(heathrow.hangar).to eq []
  end

  it 'has a default capacity' do
    expect(heathrow.capacity).to eq 60
  end

  it 'is able to change the capacity to a value given' do
    expect(manchester.capacity).to eq 29
  end
end
