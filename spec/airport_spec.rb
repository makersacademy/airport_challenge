require 'airport'
require 'plane'

describe Airport do

  before do
    @heathrow = Airport.new
    @concorde = Plane.new
    allow(@heathrow).to receive(:weather_index).and_return 0
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
    allow(@heathrow).to receive(:weather_index).and_return 6
    @heathrow.change_weather
    expect(@heathrow.weather).to eq "cloudy"
  end

  it 'changes weather when a plane wants to land' do
    allow(@heathrow).to receive(:weather_index).and_return 6
    @heathrow.accept_plane(@concorde)
    expect(@heathrow.weather).to eq "cloudy"
  end

  it 'changes weather when a plane wants to take off' do
    allow(@heathrow).to receive(:weather_index).and_return 6
    @heathrow.plane_departs(@concorde)
    expect(@heathrow.weather).to eq "cloudy"
  end

  it 'prevents landing if weather is stormy' do
    allow(@heathrow).to receive(:weather_index).and_return 9
    expect {@heathrow.accept_plane(@concorde)}.to raise_error "Plane cannot land due to poor weather"
  end

  it 'prevents departure if weather is stormy' do
    @heathrow.accept_plane(@concorde)
    allow(@heathrow).to receive(:weather_index).and_return 9
    expect {@heathrow.plane_departs(@concorde)}.to raise_error "Plane cannot take off due to poor weather"
  end

end
