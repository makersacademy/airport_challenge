require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do
  let(:airport) do
    weather = double(:weather, weather_condition: 'clear')
    Airport.new(1, weather)
  end
  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:land).with(1).arguments }

  it 'Lands and keeps a plane' do
    hangar = airport.land(plane)
    expect(hangar.include?(plane)).to eq true
  end

  it 'Lets a plane take off' do
    airport.land(plane)
    hangar = airport.take_off
    expect(hangar.count).to eq 0
  end

  it "doesn't let you land in stormy weather" do
    weather = double(:weather, weather_condition: 'stormy')
    stormy_airport = Airport.new(1, weather)
    error = 'Bad Warp storm, Landing Denied'
    expect { stormy_airport.land(plane) }.to raise_error error
  end

  it "doesn't let you take off in stormy weather" do
    weather = Weather.new
    allow(weather).to receive(:weather_condition).and_return('clear', 'stormy')
    stormy_airport = Airport.new(1, weather)
    stormy_airport.land(plane)
    hangar = stormy_airport.take_off
    expect(hangar.count).to eq 1
  end

  describe 'land' do
    it 'raises an error when hangar is full' do
      1.times { airport.land Plane.new }
      expect { airport.land(plane) }.to raise_error 'Hangar full'
    end
  end
end
