require 'airport_class'

describe Airport do

  it 'initialises airport with Aiport with array to store planes' do
    expect(subject.hangar).to be_an_instance_of(Array)
  end

end
