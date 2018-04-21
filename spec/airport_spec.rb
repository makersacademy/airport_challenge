require 'airport'

describe 'Airport capacity' do
  let(:subject) { Airport.new }

  it 'Has a default capacity of 10' do
    expect(subject.capacity).to equal 10
  end

  it 'The capacity can be changed' do
    subject.change_capacity(15)
    expect(subject.capacity).to equal 15
  end

  it 'Can be set by the user on initialisation' do
    new_airport = Airport.new(30)
    expect(new_airport.capacity).to equal 30
  end
end
