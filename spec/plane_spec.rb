require 'plane'

describe Plane do
  let(:airport) { double('airport', planes: [], capacity: 4) }
  let(:weather) { double('weather', stormy?: false) }
  it 'can create a instance' do
    expect(Plane.new).to be_truthy
  end

  describe '#status' do
    it 'can have a status' do
      expect(subject.status).to eq "Flying"
    end
    it 'status will change when landed to "Landed"' do
      subject.weather_report(weather)
      subject.land(airport)
      expect(subject.status).to eq "Landed"
    end
  end

  describe '#land' do
    it 'can instuct a plane to land in a aiport' do
      is_expected.to respond_to(:land).with(1).argument
    end

    it 'will be in airport stated' do
      subject.weather_report(weather)
      subject.land(airport)
      expect(airport.planes).to eq [subject]
    end

    it 'raise error if weather has not been reported' do
      allow(subject).to receive(:weather) { nil }
      expect { subject.land(airport) }.to raise_error("Please check weather report before")
    end

    describe 'airport full' do
      let(:airport) { double('airport', planes: ["p1", "p2", "p3", "p4"], capacity: 4) }
      it 'should not let plane land' do
        subject.weather_report(weather)
        expect { subject.land(airport) }.to raise_error("Airport full")
      end
    end

    describe 'stormy weather' do
      let(:weather) { double('weather', stormy?: true) }
      it 'can not land if weather is stormy' do
        subject.weather_report(weather)
        expect { subject.land(airport) }.to raise_error("Storm warning: cannot make that action")
      end
    end
  end

  describe '#take_off' do
    let(:airport) { double('airport', planes: [subject], capacity: 4) }
    let(:weather) { double('weather', stormy?: false) }
    it 'can instruct a plane to take off at a aiport' do
      is_expected.to respond_to(:take_off).with(1).argument
    end

    it 'will only take off if plane is in airport' do
      airbus = Plane.new
      airbus.weather_report(weather)
      expect { airbus.take_off(airport) }.to raise_error("Plane not in airport")
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
        expect { subject.take_off(airport) }.to raise_error("Storm warning: cannot make that action")
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
