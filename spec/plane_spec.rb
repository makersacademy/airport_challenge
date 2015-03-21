require 'plane'

describe Plane do

  context 'when created' do
    it 'has a flying status when created' do
      expect(subject).not_to be_flying
    end
  end

  context 'when is parked' do
    it 'can take from from an airport' do
      airport = double :airport
      control_tower = double :control_tower
      expect(airport).to receive(:control_tower).and_return(control_tower)
      expect(control_tower).to receive(:take_off_request).and_return([])
      subject.take_off_from airport
      expect(subject).to be_flying
    end
  end

  context 'when is flying' do
    it 'can land to a specific airport' do
      airport = double :airport
      another_airport = double :airport
      control_tower = double :control_tower
      another_ct = double :another_ct
      expect(airport).to receive(:control_tower).and_return(control_tower)
      expect(control_tower).to receive(:take_off_request).and_return([])
      expect(another_airport).to receive(:control_tower).and_return(another_ct)
      expect(another_ct).to receive(:land_request).and_return([subject])
      subject.take_off_from airport
      subject.land_to another_airport
      expect(subject).not_to be_flying
    end
  end

end
