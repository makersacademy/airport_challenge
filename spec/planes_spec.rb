require 'planes.rb'

RSpec.describe Planes do
  describe '#land_in' do
    it 'lands in an airport' do
      airport = Airport.new
      expect(subject.land_in(airport)).to eq airport
    end

    it 'prevents a plane from landing if it has already landed' do
      airport = Airport.new
      subject.land_in(airport)
      expect { subject.land_in(airport) }.to raise_error("Already landed.")
    end
  end

  describe '#take_off' do
    it 'takes off from an airport' do
      airport = Airport.new
      subject.land_in(airport)
      expect(subject.take_off(airport)).to eq airport
    end
  end

  it 'prevents a plane from taking off if it is already flying' do
    airport = Airport.new
    subject.land_in(airport)
    subject.take_off(airport)
    expect { subject.take_off(airport) }.to raise_error("Plane not in airport.")
  end

  it 'prevents a plane from taking off from a different airport' do
    airport = Airport.new
    airport_two = Airport.new
    subject.land_in(airport)
    expect { subject.take_off(airport_two) }.to raise_error("Plane not in airport.")
  end
end
