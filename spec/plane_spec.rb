require 'plane'

describe Plane do

  let(:airport) { double :airport, :name => 'Gatwick', :stormy? => false }

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

  describe '#land' do

    it 'confirms it has landed' do
      expect(subject.land(airport)).to eq "Tower - we have touchdown at #{airport.name}"
    end
  end

  describe '#take_off' do

    it 'confirms it has taken off from an airport' do
      expect(subject.take_off(airport)).to eq "Tower - we are now airborne, leaving #{airport.name}"
    end

    it 'does not take off if weather is stormy' do
      stormy_airport = double(:stormy? => true)
      expect { subject.take_off(stormy_airport) }.to raise_error 'Weather is stormy - departure delayed'
    end
  end

end
