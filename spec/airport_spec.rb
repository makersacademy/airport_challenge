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

  it 'responds to stormy?' do
    expect(subject).to respond_to(:stormy?)
  end
  # it 'cannot land if plane is already in an airport' do
  #   plane = "plane one"
  #   expect { subject.land_plane(plane) }.to raise_error "Plane already in airport"
  # end

#   describe '#take_off' do
#     it 'can instruct a plane to take_off' do
#       expect(subject).to respond_to(:take_off).with(1).argument
#     end

#     it 'can not take_off because plane not in airport' do
#       plane = "plane one"
#       expect { subject.take_off(plane) }.to raise_error "Plane not in airport"
#     end

    
#   end
  
end
