require 'airport'

describe Airport do
  subject(:airport) { described_class.new}

  DEFAULT_CAPACITY = 1
  it 'lands a plane' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'instructs a plane to take off and confirm they have taken off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end
  
  it 'raises an error when the airport is full' do
    DEFAULT_CAPACITY.times { airport.land Airport.new }
    expect { airport.land Airport.new }.to raise_error 'This airport is full'
  end

  
end