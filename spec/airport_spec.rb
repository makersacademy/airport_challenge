require 'airport'

describe Airport do
  # let is setup to test the same plane object in 'some' unit tests
  let(:airplane) { Plane.new }

  # Unit test - check correct instantiation of Airport object
  it 'when instantiated it creates an instance of Airport class' do
    expect(subject).to be_an_instance_of(Airport)
  end

  # Unit test - check instantiation of Airport object initializes with an empty array
  it 'initialises with an empty array' do
    expect(subject.airport).to match_array([])
  end




  # Unit test - check if airport object responds to #land method call
  it 'responds to #land method call' do
    expect(subject).to respond_to(:land).with(1).arguments
  end

  # Unit test - check a plane lands at the airport
  # (plane object added to @airport instance variable (an array))
  it 'plane lands at airport' do
    subject.land(airplane)
    expect(subject.airport).to include(airplane)
  end



  # Unit test - check if airport object responds to #take_off method call
  it 'responds to #land method call' do
    expect(subject).to respond_to(:take_off).with(1).arguments
  end

  # Unit test - check a plane takes off at the airport
  # (plane object removed from @airport instance variable (an array))
  it 'plane lands at airport' do
    subject.take_off(airplane)
    expect(subject.airport).not_to include(airplane)
  end

  # Unit test - confirm plane object has left airport
  it 'confirm plane has left the airport' do
    subject.take_off(airplane)
    expect { subject.take_off(airplane) }.to output("Confirmation the airplane has left the airport\n").to_stdout
  end

  


end
