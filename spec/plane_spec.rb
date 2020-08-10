require 'plane'

describe Plane do
  it 'checks if plane responds to method checking if it is at the airport' do
    expect(subject).to respond_to(:at_airport?)
  end
end
