require './lib/Airport'
require './lib/Plane'

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
    my_airport = Airport.new
    my_airport.lands(Plane.new)
    expect(my_airport.takeoff).to be_instance_of Plane
  end

  it 'Airport should reply to inquiry about plane status' do 
    expect(subject).to respond_to(:is_landed?).with(1).argument
  end

  it 'Airport should not land plane when full' do # Assume capacity of 1
  my_airport = Airport.new
  my_airport.lands(Plane.new)
  expect{my_airport.lands(Plane.new)}.to raise_error("No space available.")
  end

  it ' Airport should not take off plane when empty' do
    expect{subject.takeoff}.to raise_error("No planes in airport.")
  end
  

  it " Airport should repsond to takeoff for a specific plance with that plane" do
  my_airport = Airport.new
  my_plane = Plane.new
  my_airport.lands(my_plane)
  expect(my_airport.takeoff(my_plane)).to eq(my_plane)
  end

end # describe