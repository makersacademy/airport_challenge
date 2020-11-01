require 'Plane'

describe Plane do
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
      boeing = Plane.new
      heathrow = Airport.new
      boeing.land(heathrow)
      expect { subject.land(heathrow) }.to raise_error "Airport full!" 
    end
  end
  describe '#take_off' do
    it 'takes off plane from airport (removes plane from airport planes list)' do
      heathrow = Airport.new
      boeing = Plane.new
      boeing.land(heathrow)
      boeing.take_off(heathrow)
      expect(heathrow.planes).to_not include(boeing)
    end
  end
  it 'responds to #take_off() method with one argument' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end
end
