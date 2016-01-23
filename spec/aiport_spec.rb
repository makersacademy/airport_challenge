require 'airport'

describe Airport do

  it 'has an Airport class' do
    expect(subject).to be_a(Airport)
  end

  it 'has a constant CAPACITY with a default value of 5' do
    expect(Airport::CAPACITY).to eq(5)
  end

  it 'can specify the value of CAPACITY' do
    test_capacity = rand(10) + 1
    airport = Airport.new(test_capacity)
    expect(airport.capacity).to eq(test_capacity)
  end

  it 'can alter CAPACITY as needed' do
    new_capacity = 10
    airport = Airport.new
    airport.set_capacity(new_capacity)
    expect(airport.capacity).to eq(new_capacity)
  end

end
