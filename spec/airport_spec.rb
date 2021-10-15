require './lib/Airport'
require './lib/Plane'
require './lib/Weather'

describe Airport do
  it 'Airport lands plane' do
    # Arrange
    # Act
    # Assert
    expect(subject).to respond_to :lands 
  end

  it 'Plane leaves airport' do
    # Assert
    expect(subject).to respond_to :takeoff
  end

  it 'Airport accepts plane on landing' do
    expect(subject).to respond_to(:lands).with(1).argument
  end

  it 'Airport reponds to takeoff with plane' do 
    # Arrange
    my_airport = Airport.new
    my_airport.lands(Plane.new)
    allow(Weather).to receive(:forecast) {"Sunny"} do
      expect(my_airport.takeoff).to be_instance_of Plane
    end
  end

  it 'Airport should reply to inquiry about plane status' do 
    expect(subject).to respond_to(:is_landed?).with(1).argument
  end

  it 'Airport should not land plane when full' do # Assume capacity of 1
    # Arrange
    my_airport = Airport.new
    my_airport.lands(Plane.new)
    # Assert
    expect{my_airport.lands(Plane.new)}.to raise_error("No space available.")
  end

  it ' Airport should not take off plane when empty' do
    allow(Weather).to receive(:forecast) {"Sunny"} do
      expect{subject.takeoff}.to raise_error("No planes in airport.")
    end
  end
  
  it " Airport should respond to takeoff for a specific plane with that plane" do
    my_airport = Airport.new
    my_plane = Plane.new
    my_airport.lands(my_plane)
    allow(Weather).to receive(:forecast) {"Sunny"} do
      expect(my_airport.takeoff(my_plane)).to eq(my_plane)
    end
  end

  it " Airport should not repsond to takeoff for a specific plane if not landed" do
    my_airport = Airport.new
    my_plane = Plane.new
    my_airport.lands(Plane.new)
    allow(Weather).to receive(:forecast) {"Sunny"} do
      expect{my_airport.takeoff(my_plane)}.to raise_error("This plane #{my_plane} is not in the airport.")
    end
  end


  it "Airport should not allow takeoff when stormy" do
    my_airport = Airport.new
    my_plane = Plane.new
    my_airport.lands(Plane.new)
    #somehow set the weather
    allow(Weather).to receive(:forecast) {"Stormy"} do
      expect{my_airport.takeoff(my_plane)}.to raise_error("Cannot takeoff due to weather.")
    end
  end
  it 'Airport should not land plane when stormy' do # Assume capacity of 1
    # Assert
    allow(Weather).to receive(:forecast) {"Stormy"} do
      expect{my_airport.lands(Plane.new)}.to raise_error("No space available.")
    end
  end
end # describe