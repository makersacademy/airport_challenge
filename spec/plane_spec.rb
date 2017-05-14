require 'plane'

describe Plane do
  subject { described_class.new("G-ZBKP")}
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }
  it { is_expected.to respond_to(:on_ground)}
  it { is_expected.to respond_to(:location)}
  it { is_expected.to respond_to(:tail_number)}

  
  describe '#land' do
    it 'can land on airport' do
      airport = Airport.new("LHR")
      expect(subject.land(airport))
    end

    it 'confirms when lands' do
      airport = Airport.new("LHR")
      subject.land(airport)
      expect(subject.on_ground).to be true
    end

    it 'sets location to the airport it has landed' do
      airport = Airport.new("LHR")
      subject.land(airport)
      expect(subject.location).to eq airport.iata_code
    end
  end

  describe '#takeoff' do
    it 'can takeoff from airport to a destination' do
      expect(subject.takeoff(:destination))
    end

    it 'confirms departure' do
      subject.takeoff(:destination)
      expect(subject.on_ground).to be false
    end

    it 'sets location to flying after takeoff' do
      subject.takeoff(:destination)
      expect(subject.location).to eq "air"
    end
  end
end