require 'plane'

describe Plane do

  it 'should respond to kind of Plane' do
    expect(subject).to be_instance_of(Plane)
  end

  it 'should have in_air status upon intialization' do
    expect(subject.status).to eq :in_air
  end

  it 'should change the state of plane when it is landed' do
    expect(subject.status_to_in_airport).to eq :in_airport
  end

  it 'should change the state of plane to in_air after take_off' do
    expect(subject.status_to_in_air).to eq :in_air
  end

end
