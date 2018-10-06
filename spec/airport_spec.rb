require 'airport'
describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double(:plane, land: "The plane has landed") }
  let(:good_weather) { double(:weather, check_weather: "sunny") }
  let(:bad_weather) { double(:weather, check_weather: "stormy") }

  describe '#count' do
    it 'counts a plane that landed' do
      plane = double(:plane, land: "The plane has landed")
      expect(airport.count([plane])).to eq 1
    end

    it "counts 2 planes that landed" do
      plane2 = double(:Plane, land: "the plane has landed")
      planes = [plane, plane2]
      expect(airport.count(planes)).to eq 2
    end

    # it 'adds a plane to the airport when it lands' do
    #   landed_plane = plane.land(good_weather)
    #   expect(airport.count()).to eq
    # end
  end

  describe '#land' do
    it 'allows a plane to land at an airport' do
      expect(airport.land(good_weather)).to eq "The plane has landed"
    end
    it 'will not allow a plane to land if the weather is stormy' do
      forcast = bad_weather.check_weather
      expect { airport.land(forcast) }.to raise_error "The weather is stormy"
  end
end

describe '#take_off' do
  it 'allows a plane to take off and shows that the plane has left' do
    expect(airport.take_off(good_weather)).to eq "The plane has taken off"
  end
  it 'will not allow the plane to take off if the weather is stormy' do
    forcast = bad_weather.check_weather
    expect { airport.take_off(forcast) }.to raise_exception "The weather is stormy"
  end
end

  # describe '#full' do
  #   it 'raises an exception when the maximum of 1 planes have landed' do
  #     airport = Airport.new
  #     plane = double(:plane, land: "The plane has landed")
  #     landed_planes = plane.land
  #     expect {airport.count(landed_planes)}.to raise_exception "The airport is full"
  #   end
  # end
end
