# We need a plane class that creates new planes
require 'plane'
require 'airport'

describe Plane do
  context '#land' do
    it 'lands' do
      airport = Airport.new
      subject.land(airport)
      expect(subject.landed).to eq true
    end
    it "cannot land if already landed" do
      airport = Airport.new
      airport2 = Airport.new
      subject.land(airport)
      expect { subject.land(airport2) }.to raise_error "Plane already landed"
    end
  end

  context '#takeoff' do
    it 'takesoff' do
      airport = Airport.new
      subject.land(airport)
      subject.takeoff(airport)
      expect(subject.flying).to eq true
    end

    it 'cannot takeoff if already flying' do
      expect { subject.takeoff Airport.new }.to raise_error "Plane already flying"
    end

    it 'cannot takeoff from an airport is not already in' do
      airport = Airport.new
      airport2 = Airport.new
      subject.land(airport)
      expect { subject.takeoff(airport2)}.to raise_error "Plane not present at this airport"
    end
  end

end
