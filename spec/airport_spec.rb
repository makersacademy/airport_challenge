require 'airport'

describe Airport do
  it 'can create an instance of itself' do
    expect(subject).to be_kind_of(Airport)
  end

  it 'it responds to a land method - enabling flights to land' do 
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'responds to a method take off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  # Basic assumption that the airport can only hold 1 plane at a time
  it 'raises an error when planes from landing if aiport is full (ie. at capacity)' do
    # plane1 = Plane.new
    # plane2 = Plane.new
    # subject.land(plane1)
    # expect{subject.land(plane2)}.to raise_error "Airport is full"
    11.times {subject.land(Plane.new)}
    expect{subject.land(Plane.new)}.to raise_error "Airport is full"
  end

  it 'when initialized a deafult capacity exists' do
    expect(subject.capacity).to eq 10
  end

  # it 'can over-ride the default capacity if wanted' do
  #   tweaked_capacity = 
  #   expect(airport.capacity).to eq 20
  # end

end