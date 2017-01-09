require 'plane.rb'
require 'airport.rb'

context 'Instructing plane to land' do
  describe Plane do
    it 'lands at a given airport' do
      airport = Airport.new
      subject.land(airport)
      expect(subject.current_airport).to eq airport
    end

    it 'can confirm it landed' do
      airport = double(:airport)
      subject.land(airport)
      expect(subject.confirm_landing(airport)).to eq true
    end
  end
end

context 'Instructing plane to takeoff' do
  describe Plane do

    it 'takes off at a given airport' do
      airport = double(:airport)
      subject.land(airport)
      subject.takeoff(airport)
      expect(subject.current_airport).to eq nil
    end

    it 'can confirm it took off' do
      airport = double(:airport)
      subject.land(airport)
      subject.takeoff(airport)
      expect(subject.confirm_takeoff(airport)).to eq true
    end
  end
end
