require 'airport'
require 'plane'
require 'croissant'

describe Airport do

  before do
    @heathrow = Airport.new
    @concorde = Plane.new
    allow(@heathrow).to receive(:weather_index).and_return 0
  end

  it 'sets up instance variables correctly' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    expect(subject.weather).to eq "sunny"
    expect(subject.planes).to eq []
  end

  describe 'allowing a plane to land' do

    it {should respond_to :accept_plane}

    it 'can accept a plane to land' do
      @heathrow.accept_plane(@concorde)
      expect(@heathrow.planes[0]).to eq @concorde
    end
  end

  describe 'allowing a plane to depart' do

    it {should respond_to :plane_departs}

    it 'can recognise that a plane has left' do
      @heathrow.accept_plane(@concorde)
      @heathrow.plane_departs(@concorde)
      expect(@heathrow.planes).to eq []
    end
  end

  describe 'where planes are present' do

    it {should respond_to :plane_present}

    it 'can confirm if a plane is present in the airport' do
      expect(@heathrow.plane_present(@concorde)).to eq false
      @heathrow.accept_plane(@concorde)
      expect(@heathrow.plane_present(@concorde)).to eq true
    end
  end

  describe 'responding to weather' do

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
      @heathrow.accept_plane(@concorde)
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

  describe 'managing capacity' do

    it 'prevents landing if the airport is at capacity' do
      Airport::DEFAULT_CAPACITY.times{@heathrow.accept_plane(Plane.new)}
      expect {@heathrow.accept_plane(Plane.new)}.to raise_error "Plane cannot land; airport is at capacity"
    end

    it 'can take a capacity value when initialized' do
      expect(Airport.new(50).capacity).to eq 50
    end
  end

  describe 'in an edge case scenario' do
    it 'cannot accept a plane to land if it is already in the airport' do
      @heathrow.accept_plane(@concorde)
      expect {@heathrow.accept_plane(@concorde)}.to raise_error "This plane has already landed"
    end
    it 'cannot allow a croissant to land at the airport' do
      expect{@heathrow.accept_plane(Croissant.new)}.to raise_error "A Croissant is not a plane"
    end
    it 'cannot allow a croissant to fly out from the airport' do
      expect{@heathrow.plane_departs(Croissant.new)}.to raise_error "A Croissant is not a plane"
    end
    it 'cannot allow a plane to depart if it isn\'t actually there' do
      expect{@heathrow.plane_departs(@concorde)}.to raise_error "This plane is not at this airport"
    end
  end
end
