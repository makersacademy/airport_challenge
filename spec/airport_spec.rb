require 'airport'
require 'plane'
describe Airport do
  let(:airport) { Airport.new }
  let(:groundplane) { Plane.new }
  let(:airplane) { Plane.new("Airplane", true) }
  let(:tower) { double :tower }
  let(:stormtower) { double :tower }
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

  describe 'Tests for clear weather' do
    before(:each) do
      allow(airport).to receive(:weather_ok?).and_return(true)
      airport.request_weather_report
    end
    it 'should be able to land planes' do
      airport.land(airplane)
      expect(airplane.flying?).to be false
      expect(airport.view_runway).to eq [airplane]
    end

    it 'should be able to let planes take off' do
      airport.land(airplane)
      airport.take_off(airplane)
      expect(airplane.flying?).to be true
      expect(airport.empty?).to be true
    end

    it 'should be able to remove planes from the runway after takeoff' do
      airport.land(airplane)
      airport.take_off(airplane)
      expect(airport.empty?).to eq true
    end

    it 'should prevent landing when the airport is full' do
      airport.capacity.times { airport.runway << groundplane }
      expect { airport.land(airplane) }.to raise_error 'Cannot land when airport is full'
    end

    it 'should allow users to set a new airport capacity' do
      subject = Airport.new(capacity = 0)
      allow(subject).to receive(:weather_ok?).and_return(true)
      subject.request_weather_report
      expect { subject.land(airplane) }.to raise_error 'Cannot land when airport is full'
    end
  end

  describe 'Tests for stormy weather' do

    before(:each) do
      allow(airport).to receive(:weather_ok?).and_return(false)
      airport.request_weather_report
    end

    it 'should prevent planes from landing when stormy' do
      expect(airport.land(airplane)).to eq 'Cannot land in current weather conditions'
    end

    it 'should prevent planes from taking off when stormy' do
      airport.runway << groundplane
      expect(airport.take_off(groundplane)).to eq 'Cannot take off in current weather conditions'
    end
  end

end
