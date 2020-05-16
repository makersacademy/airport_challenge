require 'plane'

describe Plane do
  it 'responds to #at_airport?' do
    expect(subject).to respond_to(:at_airport?)
  end

  it 'returns false once taken off' do
    airport = Airport.new
    airport.take_off(subject)
    expect(subject.at_airport?).to eq(false)
  end
end
