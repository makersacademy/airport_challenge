require 'plane'

describe Plane do
  let(:airport) { double(:airport, :land => true, :leave => true) }
  it 'is possible to create planes' do
    expect(Plane.new).to be_instance_of Plane
  end

  it 'can be told to fly to an airport' do
    subject.fly_to airport
    expect(subject.destination).to eq airport
  end

  it 'can be told to take off from an airport' do
    subject.take_off airport
    expect(subject.destination).to eq nil
  end

end
