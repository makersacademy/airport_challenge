require 'plane'

describe Plane do
  it 'can create a instance' do
    expect(Plane.new).to be_truthy
  end

  describe '#land' do
    let(:airport) { double('airport', planes: []) }
    it 'can instuct a plane to land in a aiport' do
      is_expected.to respond_to(:land).with(1).argument
    end

    it 'will be in airport stated' do
      subject.land(airport)
      expect(airport.planes).to eq [subject]
    end
  end

  describe '#take_off' do
    let(:airport) { double('airport', planes: [subject]) }
    let(:weather) { double('weather', stormy?: false) }
    it 'can instruct a plane to take off at a aiport' do
      is_expected.to respond_to(:take_off).with(1).argument
    end

    it 'will not be in the airport stated after take_off' do
      subject.weather_report(weather)
      subject.take_off(airport)
      expect(airport.planes).to eq []
    end

    it 'raise error if weather has not been reported' do
      allow(subject).to receive(:weather) { nil }
      expect { subject.take_off(airport) }.to raise_error("Please check weather report before")
    end

    describe 'stormy weather' do
      let(:weather) { double('weather', stormy?: true) }
      it 'can not take off if weather is stormy' do
        subject.weather_report(weather)
        expect { subject.take_off(airport) }.to raise_error("Plane cannot take off in the storm")
      end
    end
  end

  describe '#weather_report' do
    let(:weather) { double('weather', stormy?: true) }
    it 'lets plane know the current weather' do
      expect(subject.weather_report(weather)).to eq weather
    end
  end

end
