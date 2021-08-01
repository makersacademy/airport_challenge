require 'airport'

describe Airport do
  # let is setup to test the same plane object in 'some'  tests
  let(:airplane) { Plane.new }

  # test - check correct instantiation of Airport object
  it 'when instantiated it creates an instance of Airport class' do
    expect(subject).to be_an_instance_of(Airport)
  end

  # test - check instantiation of Airport object initializes with an empty array
  it 'initialises with an empty array' do
    expect(subject.airport).to match_array([])
  end

  # test - check if airport object responds to #land method call
  it 'responds to #land method call' do
    expect(subject).to respond_to(:land).with(1).arguments
  end

  # test - check a plane can land at the airport
  # (plane object added to @airport instance variable (an array))
  it 'plane lands at airport' do
    subject.land(airplane)
    expect(subject.airport).to include(airplane)
    expect(airplane.grounded).to be true
  end

  # test - raises error if calling #take_off with no planes at the airport
  it 'raises error when no planes at airport try to take off' do
    # subject.take_off(airplane) ## Add this line in to make this test work when using 'rspec' command
    expect { raise subject.take_off(airplane) }.to raise_error("There are no planes at the airport to take off")
  end

  # test - check if airport object responds to #take_off method call
  it 'responds to #take_off method call' do
    expect(subject).to respond_to(:take_off).with(1).arguments
  end

  # test - check a plane takes off at the airport
  # (plane object removed from @airport instance variable (an array))
  it 'plane takes off' do
    subject.land(airplane)
    subject.take_off(airplane)
    expect(subject.airport).not_to include(airplane)
  end

  # test - confirm plane object has left airport
  it 'confirm plane has left the airport' do
    subject.land(airplane)
    expect { subject.take_off(airplane) }.to output("The plane has left the airport\n").to_stdout
  end

  # test - Error message if more than 20 planes try to land at the airport
  it "raise error when airport full" do
    Airport::DEFAULT_CAPACITY.times do
      subject.land(airplane)
    end
    expect { raise subject.land(airplane) }.to raise_error("The airport is full and can't land anymore planes")
  end

  # test for default airport capacity
  it 'has a default capacity' do
    expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end 

  # This is as far as I got - I wasn't able to implement testing for variable capacity
  #
  # it 'has a variable capacity' do
  #   subject(50)
  #   50.times { subject.land(airplane) }
  #   expect { raise subject.land(airplane) }.to raise_error("The airport is full and can't land anymore planes")
  # end

end
