require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  it 'is expected to have a default capacity' do
    shane_airport = airport
    expect(shane_airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'is expected to have a user-specified capacity' do
    shane_airport = Airport.new(40)
    expect(shane_airport.capacity).to eq 40
  end

  # it 'is expected to have a airplane capacity' do
  #   airport()
  #
  end
