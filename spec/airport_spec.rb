require 'airport_class'

describe Airport do

  it 'initialises Aiport with array to store planes' do
    expect(subject.hangar).to be_an_instance_of(Array)
  end

  it 'initialises Airport with capacity that can be set as argument of initialise method' do
    expect(subject.capacity).to eq 5
  end

end
