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

  describe '#land_at_airport' do
    it 'can request a landing and land in good conditions' do
      srand(3)
      expect(subject.land_at_airport(Airport.new)).to eq subject
      expect(subject.current_airport.class).to eq Airport
    end

    it 'can request a landing but be rejected in bad conditions' do
      srand(4)
      expect(subject.land_at_airport(Airport.new)).to eq false
      expect(subject.current_airport).to eq nil
    end
  end

  describe '#launch_from_airport' do
    it 'can request a launch and take off in good conditions' do
      testport = Airport.new
      testport.add_to_hangar(subject)
      srand(3)
      expect(subject.launch_from_airport(testport)).to eq subject
      expect(subject.current_airport).to eq nil
    end
  end
end
