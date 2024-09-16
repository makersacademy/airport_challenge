require 'Plane'

describe Plane do
  let(:full_airport_not_stormy) { double :airport, :capacity => 1, :planes => [Plane.new], :stormy? => false }
  let(:stormy_weather) { double :airport, :capacity => 20, :planes => [], :stormy? => true }
  it 'responds to #land() method with one argument' do
    expect(subject).to respond_to(:land).with(1).argument
  end
  describe '#land()' do
    it 'lands plane at airport (adds it to list of planes at that airport)' do
      boeing = Plane.new
      heathrow = Airport.new
      boeing.land(heathrow)
      expect(heathrow.planes).to include(boeing)
    end
    it 'does not land a plane if airport is full' do
      expect { subject.land(full_airport_not_stormy) }.to raise_error "Airport full!"
    end
    it 'does not land a plane if weather is stormy' do
      expect { subject.land(stormy_weather) }.to raise_error "Stormy conditions preventing landing"
    end
  end
  describe '#take_off' do
    it 'takes off plane from airport (removes plane from airport planes list)' do
      boeing = Plane.new
      airport = double :airport, :capacity => 20, :planes => [boeing], :stormy? => false
      boeing.take_off(airport)
      expect(airport.planes).to_not include(boeing)
    end
    it 'can not take off plane from airport if weather is stormy' do
      expect { subject.take_off(stormy_weather) }.to raise_error "It's stormy, cannot take off!"
    end
  end
  it 'responds to #take_off() method with one argument' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end
end
