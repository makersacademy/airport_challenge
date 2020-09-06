require 'airport_class'

describe Airport do

  it 'initialises Aiport with array to store planes' do
    expect(subject.hangar).to be_an_instance_of(Array)
  end

  it 'initialises Airport with custom capacity' do
    airport = Airport.new(10)
    expect(airport.capacity).to eq 10
  end

  it 'initialises Airport with DEFAULT_CAPACITY' do
    airport = Airport.new
    expect(airport.capacity). to eq Airport:: DEFAULT_CAPACITY
  end

end
