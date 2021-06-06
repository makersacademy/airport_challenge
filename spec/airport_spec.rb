require 'airport'

describe Airport do
  
  it 'can land a plane at the airport' do
    expect(subject).to respond_to(:land_plane) # .with(1).argument
  end

  it 'can instruct a plane to take_off' do
    expect(subject).to respond_to(:take_off) # .with(1).argument
  end

  it 'can confirm the plane is no longer in the airport after take_off' do
    expect(subject.take_off).to eq "Successfull take-off"
  end

  it 'can prevent plane landing when airport is full' do
    expect { subject.land_plane }.to raise_error "Airport is full"
  end

  it 'gives default capacity of 10' do
    expect(subject.capacity).to eq(10)
  end
  
  it 'allows override of capacity' do
    new_airport = Airport.new(20)
    expect(new_airport.capacity).to eq(20)
  end

  it 'can set the current weather' do
    expect(subject.current_weather("stormy")).to eq "stormy"
  end

  it 'responds to stormy?' do
    expect(subject).to respond_to(:stormy?)
  end

  it 'raise error when stormy' do
    new_airport = Airport.new
    new_airport.current_weather("stormy")
    expect { subject.take_off }.to raise_error "Grounded due to stormy weather"
  end
  
end
