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

    it 'returns an error if non-Airport argument is passed' do
      expect { subject.land_at_airport("Airport") }.to raise_error 'Call error: must include a Plane as an argument'
    end

    it 'can request a landing but be rejected in bad conditions' do
      srand(4)
      expect(subject.land_at_airport(Airport.new)).to eq false
      expect(subject.current_airport).to eq nil
    end

    it 'can only land if not already in an airport' do
      testport = Airport.new
      srand(3)
      subject.land_at_airport(testport)
      expect { subject.land_at_airport(testport) }.to raise_error 'Cannot land: plane is already in an airport'
    end
  end

  describe '#launch_from_airport' do
    it 'can request a launch and take off in good conditions' do
      testport = Airport.new
      subject.land_at_airport(testport)
      srand(3)
      expect(subject.launch_from_airport(testport)).to eq subject
      expect(subject.current_airport).to eq nil
    end

    it 'can only launch a plane if it\'s in the right airport' do
      expect { subject.launch_from_airport(Airport.new) }.to raise_error 'Cannot launch: plane is not in this airport'
    end
  end

  describe '#confirm_flying' do
    it 'confirms flight while plane is flying (i.e. not in an airport)' do
      expect(subject.confirm_flying).to eq true
    end

    it 'warns if plane is not flying (i.e. in an airport)' do
      subject.land_at_airport(Airport.new)
      expect(subject.confirm_flying).to eq false
    end
  end
end
