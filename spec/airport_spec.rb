require './lib/airport'

describe Airport do
  let(:weather_good) { double :weather, :forecast => :sunny }
  let(:weather_bad) { double :weather, :forecast => :stormy }
  let(:plane) { double :plane }

  it 'should initialize with empty planes array' do
    expect(subject.planes).to eq([])
  end

  context '#capacity' do
    it 'should instantiate with a default capacity of 20' do
      expect(subject.capacity).to eq(20)
    end

    it 'should raise error if capacity exceeded' do
      allow(plane).to receive(:land)
      20.times { subject.accept_plane(plane) }
      expect { subject.accept_plane(plane) }.to raise_error 'Airport is at capacity. Landing is not authorized'
    end

    it 'should set capacity' do
      subject.capacity = 50
      expect(subject.capacity).to eq(50)
    end

    it 'should raise error if set capacity exceeded' do
      allow(plane).to receive(:land)
      subject.capacity = 50
      50.times { subject.accept_plane(plane) }
      expect { subject.accept_plane(plane) }.to raise_error 'Airport is at capacity. Landing is not authorized'
    end
  end

  context '#accept_plane' do

    it 'should receive one argument' do
      expect(subject).to respond_to(:accept_plane).with(1).argument
    end

    it 'should allow a plane to land if airport open' do
      allow(plane).to receive(:land)
      expect(subject.accept_plane(plane)).to eq [plane]
    end

    it 'should raise error if weather conditions close airport' do
      subject.analyze_forecast(weather_bad)
      expect { subject.accept_plane(plane) }.to raise_error('Due to weather conditions landing is not authorized')
    end
  end

  context '#release_plane' do

    it 'should receive one argument' do
      expect(subject).to respond_to(:release_plane).with(1).argument
    end

    it 'should release plane if airport open' do
      allow(plane).to receive(:take_off)
      subject.release_plane(plane)
      subject.analyze_forecast(weather_good)
      expect(subject.release_plane(plane)).to eq true
    end

    it 'should raise error if weather conditions close airport' do
      allow(plane).to receive(:land)
      subject.accept_plane(plane)
      subject.analyze_forecast(weather_bad)
      expect { subject.release_plane(plane) }.to raise_error('Due to weather conditions take off is not authorized')
    end
  end

  feature 'Landing feature' do
    scenario 'Stormy weather scenario' do
      given_there_is_a_plane
      and_airport_weather_is_stormy
      it_does_not_allow_plane_to_land
    end

    scenario 'Sunny weather scenario' do
      given_there_is_a_plane
      and_airport_weather_is_sunny
      it_allows_plane_to_land
    end

    def given_there_is_a_plane
      @plane = double :plane
      allow(@plane).to receive(:land)
    end

    def and_airport_weather_is_stormy
      @airport = subject
      @airport.analyze_forecast(weather_bad)
    end

    def it_does_not_allow_plane_to_land
      expect { @airport.accept_plane(@plane) }.to raise_error('Due to weather conditions landing is not authorized')
    end

    def and_airport_weather_is_sunny
      @airport = subject
      @airport.analyze_forecast(weather_good)
    end

    def it_allows_plane_to_land
      expect(@airport.accept_plane(@plane)).to eq [@plane]
    end
  end

  feature 'Take off feature' do
    scenario 'Stormy weather scenario' do
      given_there_is_a_plane_landed_at_an_airport
      and_airport_weather_is_stormy
      it_does_not_allow_plane_to_take_off
    end

    scenario 'Sunny weather scenario' do
      given_there_is_a_plane_landed_at_an_airport
      and_airport_weather_is_sunny
      it_allows_plane_to_take_off
    end

    def given_there_is_a_plane_landed_at_an_airport
      @plane = double :plane
      allow(@plane).to receive(:land)
      allow(@plane).to receive(:take_off)
      @airport = subject
      @airport.accept_plane(@plane)
    end

    def and_airport_weather_is_stormy
      @airport.analyze_forecast(weather_bad)
    end

    def it_does_not_allow_plane_to_take_off
      expect { @airport.release_plane(@plane) }.to raise_error('Due to weather conditions take off is not authorized')
    end

    def and_airport_weather_is_sunny
      @airport.analyze_forecast(weather_good)
    end

    def it_allows_plane_to_take_off
      expect(@airport.release_plane(@plane)).to eq true
    end

  end

  feature 'Plane divert feature' do
    scenario 'airport_a bad weather. airport_b good weather to bad. airport_c good weather' do
      given_three_planes
      airport_a_has_bad_weather
      plane1_airport_a_refused
      airport_b_has_good_weather
      plane1_diverted_airport_b
      plane2_lands_at_airport_b
      airport_b_weather_changes
      plane3_airport_b_refused
      airport_c_has_good_weather
      plane3_diverted_airport_c
    end

    def given_three_planes
      @planes = []

      @planes << double(:plane1)
      @planes << double(:plane2)
      @planes << double(:plane3)

      @planes.each do |plane|
        allow(plane).to receive(:land)
        allow(plane).to receive(:take_off)
      end

    end

    def airport_a_has_bad_weather
      @airport_a = Airport.new
      @airport_a.analyze_forecast(weather_bad)
    end

    def plane1_airport_a_refused
      expect { @airport_a.accept_plane(@planes[0]) }.to raise_error('Due to weather conditions landing is not authorized')
    end

    def airport_b_has_good_weather
      @airport_b = Airport.new
      @airport_b.analyze_forecast(weather_good)
    end

    def plane1_diverted_airport_b
      expect(@airport_b.accept_plane(@planes[0])).to eq [@planes[0]]
    end

    def plane2_lands_at_airport_b
      expect(@airport_b.accept_plane(@planes[1])).to eq [@planes[0], @planes[1]]
    end

    def airport_b_weather_changes
      @airport_b.analyze_forecast(weather_bad)
    end

    def plane3_airport_b_refused
      expect { @airport_b.accept_plane(@planes[2]) }.to raise_error('Due to weather conditions landing is not authorized')
    end

    def airport_c_has_good_weather
      @airport_c = Airport.new
      @airport_c.analyze_forecast(weather_good)
    end

    def plane3_diverted_airport_c
      expect(@airport_c.accept_plane(@planes[2])).to eq [@planes[2]]
    end
  end
end
