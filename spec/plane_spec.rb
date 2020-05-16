require 'plane'

describe Plane do
  it 'responds to #at_airport?' do
    expect(subject).to respond_to(:at_airport?)
  end

  describe '#at_airport' do
    it 'returns false when plane takes off' do
      airport = Airport.new
      subject = airport.take_off
      expect(subject.at_airport?).to eq(false)
    end
  end
end
