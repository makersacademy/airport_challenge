describe 'Airport Features' do

  # 1. User Story
  it 'so passengers get to destination, instruct planes to land' do
    airport = Airport.new(10)
    plane = Plane.new
    #below should work without raising an error
    expect { airport.land(plane) }.not_to raise_error
  end
    

  # 2. User Story Part 1
  it 'so planes can take off from airport, instruct planes to take off' do
    airport = Airport.new(10)
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end

  # # 2. User Story Part 2
  # it 'confirm that planes are no longer at airport once taken off' do
  #   puts 'Plane has now taken off' 
  # end

    

  # 3. User Story
  it 'to ensure safety, instrcut planes not to land when airport is full' do
    #airport capacity = 10
    airport = Airport.new(10)
    plane = Plane.new
    10.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error 'Caution: Airport full, plane cannot land. MAX capacity: 10'
  end
end