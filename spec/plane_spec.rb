require "plane"

describe Plane do
  it 'itiates with no airport in @current_airport' do
    expect(subject.current_airport).to eq nil
  end

  describe '#update_airport' do
    it 'sets @current_airport to the passed airport' do
      new_airport = Airport.new
      subject.update_airport(new_airport)
      expect(subject.current_airport).to eq new_airport
    end

    it 'sets @airport to nil if no args passed' do
      subject.update_airport
      expect(subject.current_airport).to eq nil
    end

    it 'returns an error if non-Airport argument is passed' do
      expect { subject.update_airport("Airport") }.to raise_error 'Call error: must include an Airport as an argument'
      expect { subject.update_airport(Airport.new) }.to_not raise_error
    end
  end
end
