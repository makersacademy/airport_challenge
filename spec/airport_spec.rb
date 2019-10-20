require 'airport'
require 'airplane'
require 'weather'

RSpec.describe Airport do
  let(:airport) { Airport.new }
  let(:airplane) { Airplane.new }
  let(:weather) { Weather.new }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:takeoff) }

  it { is_expected.to respond_to(:full?) }

  describe '#take off' do
    it "prevents to take off in case of stormy" do
      forecast = create_sunny_weather
      subject = Airport.new(forecast)
      subject.land(airplane)
      allow(forecast).to receive(:stormy?).and_return(true)
      expect { subject.takeoff }.to raise_error "No planes can take off, stormy weather."
    end
  end

  describe '#land' do
    it "prevents to land planes in case of stormy" do
      forecast = create_sunny_weather
      subject = Airport.new(forecast)
      allow(forecast).to receive(:stormy?).and_return(true)
      expect { subject.land(airplane) }.to raise_error "No planes can land, stormy weather."
    end
  end

  describe '#full?' do
    it "prevents to land planes in case of full airport" do
      capacity = 2
      gatwick = Airport.new(create_sunny_weather, capacity)
      gatwick.land(airplane)
      gatwick.land(airplane)
      expect { gatwick.land(airplane) }.to raise_error "No more planes can land, airport full."
    end
  end

  it "has capacity of 20" do
    expect(Airport::DEFAULT_CAPACITY).to eq 20
  end

  def create_weather(stormy)
    weather = double("Weather")
    allow(weather).to receive(:stormy?).and_return(stormy)
    weather
  end

  def create_stormy_weather
    create_weather(true)
  end

  def create_sunny_weather
    create_weather(false)
  end

end
