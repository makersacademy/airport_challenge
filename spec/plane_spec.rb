require 'plane'

describe Plane do
  let(:airport) do
    airport = Airport.new
    allow(airport).to receive(:check_weather).and_return("sunny")
    airport
  end
  let(:stormy_airport) do
    stormy_airport = Airport.new
    allow(stormy_airport).to receive(:check_weather).and_return("stormy")
    stormy_airport
  end

  it { is_expected.to respond_to(:land).with(1).argument }
  describe '#land' do
    it 'lands at an airport' do
      expect(subject.land(airport)).to eq airport  
    end
    it 'gives an error when airport is full' do
      5.times { Plane.new.land(airport) }
      expect { subject.land(airport) }.to raise_error 'Landing prevented: Airport full'
    end
    it 'prevents landing when weather is stormy' do
      expect(subject.land(stormy_airport)).to eq "Unable to land. Weather is stormy"
    end
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }
  describe '#take_off' do
    it 'takes off from an airport' do
      subject.land(airport)
      expect(subject.take_off(airport)).to eq "#{subject} is no longer in #{airport}"
    end
    it 'prevents taking off when weather is stormy' do
      allow(stormy_airport.hangar).to receive(:include?).and_return(true)
      expect(subject.take_off(stormy_airport)).to eq "Unable to take-off. Weather is stormy"
    end
    it 'prevents taking off when plane is not in that airport' do
      expect { subject.take_off(airport) }.to raise_error 'Unable to take-off. Plane not in that airport'
    end
  end
end
