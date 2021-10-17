require './lib/airport'
require './lib/plane'

describe Airport do

  it 'Airport reponds to non-specific takeoff, with last plane in' do 
    my_airport = Airport.new
    my_plane = Plane.new
    allow(my_airport).to receive(:forecast?).and_return("Sunny")
    my_airport.lands(my_plane)
    expect(my_airport.takeoff).to eq(my_plane)
  end

  it 'Airport should reply to inquiry about plane status' do 
    my_airport = Airport.new
    my_plane = (Plane.new)
    expect(my_airport.is_landed?(my_plane)).to eq(false)
    allow(my_airport).to receive(:forecast?).and_return("Sunny")
    my_airport.lands(my_plane)
    expect(my_airport.is_landed?(my_plane)).to eq(true)
  end

  it 'Airport should not land plane when full' do # Assume default capacity of 1
    my_airport = Airport.new
    allow(my_airport).to receive(:forecast?).and_return("Sunny")
    puts my_airport.gates
    (my_airport.gates).times{my_airport.lands(Plane.new)}
    allow(my_airport).to receive(:forecast?).and_return("Sunny")
      expect{my_airport.lands(Plane.new)}.to raise_error("No space available.")
  end

  it ' Airport should not take off plane when airport is empty' do
    my_airport = Airport.new
    allow(my_airport).to receive(:forecast?).and_return("Sunny")
    expect{my_airport.takeoff}.to raise_error("No planes in airport.")
  end
  
  it " Airport should respond to takeoff for a specific plane with that plane" do
    my_airport = Airport.new
    my_plane = Plane.new
    allow(my_airport).to receive(:forecast?).and_return("Sunny")
    my_airport.lands(my_plane)
    expect(my_airport.takeoff(my_plane)).to eq(my_plane)
  end

  it " Airport should not repsond to takeoff for a specific plane if not landed" do
    my_airport = Airport.new
    my_plane = Plane.new
    allow(my_airport).to receive(:forecast?).and_return("Sunny")
    my_airport.lands(Plane.new)
    expect{my_airport.takeoff(my_plane)}.to raise_error("This plane #{my_plane} is not in the airport.")
  end

  it 'Airport gate default capacity is set' do
    expect(Airport.new.gates).to eq Airport::DEFAULT_GATES
  end

  it 'Airport gate capacity can be changed' do
    expect(Airport.new(5).gates).to eq(5)
  end

  it "Airport should not allow takeoff when stormy" do
    my_airport = Airport.new
    my_plane = Plane.new
    allow(my_airport).to receive(:forecast?).and_return("Sunny")
    my_airport.lands(Plane.new)
    allow(my_airport).to receive(:forecast?).and_return("Stormy")
    expect{my_airport.takeoff(my_plane)}.to raise_error("Cannot takeoff due to weather.")
  end

  it 'Airport should not land plane when stormy' do 
    # Assert
    my_airport = Airport.new
    allow(my_airport).to receive(:forecast?).and_return("Stormy")
    expect{my_airport.lands(Plane.new)}.to raise_error("Cannot land due to weather.")
  end

end # describe