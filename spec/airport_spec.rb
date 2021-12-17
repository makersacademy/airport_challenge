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
  it 'raises an error when planes from landing if aiport is full' do
    plane1 = Plane.new
    plane2 = Plane.new
    subject.land(plane1)
    expect{subject.land(plane2)}.to raise_error "Airport is full"
  end

  it 'when initialized a deafult capacity exists' do
    expect(subject.capacity).to eq 10
  end

end