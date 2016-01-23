require 'plane'

describe Plane do

  describe '#initialize' do

    it {is_expected.to respond_to(:airborne)}
    it 'should initialize as not airborne' do
      expect(subject.airborne).to be false
    end

  end

  describe '#takeoff' do

    it {is_expected.to respond_to(:airborne)}

    let(:airport) { double(:airport, :planes => []) }
    it 'should be able to be airborne' do
      expect(subject.takeoff(airport)).to be_truthy
    end

  end

  describe '#land' do

    it {is_expected.to respond_to(:airborne)}

    let(:airport) { double(:airport, :planes => []) }
    it 'should be able to land' do
      expect(subject.land(airport)).to be false
    end

    let(:airport) { double(:airport, :planes => []) }
    airport = Airport.new
    it 'should be in the airport it landed in' do
      subject.land(airport)
      expect(airport.planes).to include subject
    end

  end

end
