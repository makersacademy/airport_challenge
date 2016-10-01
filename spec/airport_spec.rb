require 'airport'
require 'plane'

describe Airport do

  before do
    @heathrow = Airport.new
    @concorde = Plane.new
  end

  it 'sets up instance variables correctly' do
    expect(subject.capacity).to eq 20
    expect(subject.weather).to eq "sunny"
    expect(subject.planes).to eq []
  end

  it {should respond_to :accept_plane}

  it 'can accept a plane to land' do
    @heathrow.accept_plane(@concorde)
    expect(@heathrow.planes[0]).to eq @concorde
  end

  it {should respond_to :plane_departs}

  it 'can recognise that a plane has left' do
    @heathrow.accept_plane(@concorde)
    @heathrow.plane_departs(@concorde)
    expect(@heathrow.planes).to eq []
  end

  it {should respond_to :plane_present}

  it 'can confirm if a plane is present in the airport' do
    expect(@heathrow.plane_present(@concorde)).to eq false
    @heathrow.accept_plane(@concorde)
    expect(@heathrow.plane_present(@concorde)).to eq true
  end

  it {should respond_to :change_weather}

  it 'can have changeable weather' do
    allow(@heathrow).to receive(:weather_index).and_return 9
    @heathrow.change_weather
    expect(@heathrow.weather).to eq "stormy"
  end
end
