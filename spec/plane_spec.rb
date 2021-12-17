require 'plane'

describe Plane do
  let(:airport) { Airport.new }
  # let(:weather) { double("sunny") }

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
      allow(subject).to receive(:check_weather).and_return("stormy")
      expect(subject.land(airport)).to eq "Unable to land. Weather is stormy"
    end
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }
  describe '#take_off' do
    it 'takes off from an airport' do
      subject.land(airport)
      expect(subject.take_off(airport)).to eq "#{subject} is no longer in #{airport}"
    end
  end
end
