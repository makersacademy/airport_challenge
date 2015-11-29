require 'airport.rb'

describe Airport do
let(:plane1) {Plane.new}

  describe '#land' do
    context 'when spare capacity at airport' do
      it 'lands a plane' do
        expect(subject.land(plane1).last).to eq plane1
      end
    end
    context 'when airport full as reached default capacity,' do
      it 'plane causes airport full error' do
        described_class::DEFAULT_CAPACITY.times {subject.land(plane1)}
        expect {subject.land(plane1)}.to raise_error("Airport is full")
      end
    end

  end

  describe '#take_off' do
    context 'when plane not at airport' do
      it 'takes_off a plane gets error' do
        expect { subject.take_off(plane1)}.to raise_error("This plane is not at this airport")
      end
    end
  end

  describe '#weather_good?' do
    context 'when stormy' do
      let(:weather) { double("weather", :current => "stormy") }
      it 'weather_good? false' do
        expect(subject.weather_good?(weather.current)).to be false
      end
      it 'set weather_good as false' do
        subject.weather_good?(weather.current)
        expect(subject.weather_good).to be false
      end
      it 'takes_off a plane' do
        subject.weather_good?(weather.current)
        expect {subject.take_off(plane1) }.to raise_error("Weather not good cannot take-off")
      end
      it 'lands a plane' do
        subject.weather_good?(weather.current)
        expect {subject.land(plane1) }.to raise_error("Weather not good cannot land")
      end
    end
    context 'when sunny' do
      let(:weather) { double("weather", :current => "sunny") }
      it 'takes_off a plane' do
        subject.weather_good?(weather.current)
        subject.land(plane1)
        expect(subject.take_off(plane1)).to eq plane1
      end
      it 'lands a plane' do
        subject.weather_good?(weather.current)
        expect(subject.land(plane1).last).to eq plane1
      end
    end
  end

  describe '#capacity=' do
    context 'when capacity set during initialize' do
      subject { Airport.new 10 }
      it 'given initialize' do
        10.times {subject.land(plane1)}
        expect {subject.land(plane1)}.to raise_error("Airport is full")
      end
    end
    context 'when capacity set using capacity= method' do
      it 'given capacity' do
        subject.capacity = 15
        15.times {subject.land(plane1)}
        expect {subject.land(plane1).to raise_error("Airport is full")}
      end
    end
  end

end