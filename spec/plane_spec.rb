require 'plane'

describe Plane do
  let(:airport) { double(:airport, :land => true, :leave => true) }

  it 'can be told to fly to an airport' do
    subject.fly_to airport
    expect(subject.destination).to eq airport
  end

  it 'can be told to take off from an airport' do
    subject.take_off airport
    expect(subject.destination).to eq nil
  end

end
