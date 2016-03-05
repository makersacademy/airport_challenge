require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) {double(:plane)}
  it { expect(subject).to respond_to(:land).with(1).argument }
  it { expect(subject).to respond_to(:in_airport? ).with(1).argument }
  it { expect(subject).to respond_to(:take_off).with(1).argument }

  describe '#land' do
    it 'stores a plane in an airport' do
      subject.land(plane)
      expect(subject.landed_planes).to include plane
    end
  end

  describe '#take_off' do
    it 'raises error if plane is not at airport' do
      error_message = 'Plane not at airport'
      expect {subject.take_off(plane)}.to raise_error(error_message)
    end
    context 'good weather to fly' do
      before {allow(airport).to receive(:flying_weather?).and_return(true)}
      xit 'removes a plane from an airport with one plane' do
      end

      xit 'removes last plane from an airport with many planes' do
      end

      it 'removes plane from an airport' do
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.landed_planes).not_to include plane
      end
    end

    context 'bad weather to fly' do
      before {allow(airport).to receive(:flying_weather?).and_return(false)}
      it 'not allowed when stormy weather' do
        error_message = "Too stormy to fly"
        subject.land(plane)
        expect {subject.take_off(plane)}.to raise_error(error_message)
      end
    end
  end

  describe '#plane_landed?' do
    before {allow(airport).to receive(:flying_weather?).and_return(true)}

    it 'confirms the plane is in the airport'  do
      subject.land(plane)
      expect(subject.in_airport?(plane)).to be true
    end

    it 'confirms the plane is not at the aiport' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.in_airport?(plane)).to be false
    end
  end
end
