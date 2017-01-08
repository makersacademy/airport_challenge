require 'plane.rb'
require 'airport.rb'

context 'Instructing plane to land' do
  describe Plane do
    it 'has an airport attribute' do
      expect(subject.respond_to?(:current_airport)).to eq true
    end

    it 'can be instructed to land' do
      expect(subject.respond_to?(:land)).to eq true
    end

    it 'lands at a given airport' do
      airport = Airport.new
      subject.land(airport)
      expect(subject.current_airport).to eq airport
    end

    it 'can confirm it landed' do
      airport = Airport.new
      subject.land(airport)
      expect(subject.confirm_landing(airport)).to eq true
    end
  end
end

context 'Instructing plane to takeoff' do
  describe Plane do
    it 'can be instructed to takeoff' do
      expect(subject.respond_to?(:takeoff)).to eq true
    end

    it 'takes off at a given airport' do
      airport = Airport.new
      subject.land(airport)
      subject.takeoff(airport)
      expect(subject.current_airport).to eq nil
    end

    it 'can confirm it took off' do
      airport = Airport.new
      subject.land(airport)
      subject.takeoff(airport)
      expect(subject.confirm_takeoff(airport)).to eq true
    end
  end
end
