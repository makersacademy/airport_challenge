require "plane.rb"

describe Plane do
  describe '#landed' do
    it 'can confirm that is has landed' do
      airport = double(:airport)
      allow(airport).to receive_messages(:land => subject.landing)
      airport.land(subject)
      expect(subject.flying).to eq(false)
    end
  end

  describe '#taking_off' do
    it 'can confirm that is has took off' do
      airport = double(:airport)
      allow(airport).to receive_messages(:land => subject.landing, :take_off => subject.taking_off)
      airport.land(subject)
      airport.take_off(subject)
      expect(subject.flying).to eq(true)
    end
  end
end
