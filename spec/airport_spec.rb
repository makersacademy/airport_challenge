require 'airport'

describe Airport do
  # let is setup to test the same plane object in 'some' unit tests
  let(:airplane) { Plane.new }
  let(:empty_array) {[]}

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

  # Unit test - check a plane can land at the airport
  # (plane object added to @airport instance variable (an array))
  it 'plane lands at airport' do
    subject.land(airplane)
    expect(subject.airport).to include(airplane)
    expect(airplane.grounded).to be true
  end

  #Unit test - raises error if calling #take_off with no planes at the airport
  it 'raises error when no planes at airport try to take off' do
    # subject.take_off(airplane) ## Add this line in to make this test work when using 'rspec' command
    
    expect { raise subject.take_off(airplane) }.to raise_error("There are no planes at the airport to take off")
  end

  # Unit test - check if airport object responds to #take_off method call
  it 'responds to #take_off method call' do
    expect(subject).to respond_to(:take_off).with(1).arguments
  end

  # Unit test - check a plane takes off at the airport
  # (plane object removed from @airport instance variable (an array))
  it 'plane takes off' do
    subject.land(airplane)
    subject.take_off(airplane)
    expect(subject.airport).not_to include(airplane)
  end







  # Unit test - confirm plane object has left airport
  it 'confirm plane has left the airport' do
    subject.land(airplane)
    # subject.take_off(airplane) # If I call this then the expect error below doesn't work.... why?! because im already calling it belo........
    expect { subject.take_off(airplane) }.to output("The plane has left the airport\n").to_stdout
    
  end




  # Unit test - Error message if more than 20 planes try to land at the airport
  it "don't land a plane if the airport is full" do
    20.times { subject.land(airplane) }
    expect { raise subject.land(airplane) }.to raise_error("The airport is full and can't land anymore planes")
  end

end
