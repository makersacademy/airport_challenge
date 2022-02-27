require 'airport.rb'

describe Airport do
  let(:plane) { double :plane }
  
  it 'should respond to land' do
    expect(subject).to respond_to(:land)
  end

  it 'should allow the air traffic controller to specify a plane to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'should allow specific planes to take off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'should ensure a plane is no longer at the airport when taking off' do
    subject.land(plane)
    subject.take_off(plane)
    # the plane should've landed and taken off, so trying to take off another plane should not work.
    expect { subject.take_off(plane) }.to raise_error 'Airport is empty'
  end

  it 'should raise an error when trying to land a plane at a full airport' do
    #assuming a capacity of 1
    another_plane = double(:plane)
    subject.land(plane)
    expect { subject.land(another_plane) }.to raise_error 'Airport is full'
  end

end