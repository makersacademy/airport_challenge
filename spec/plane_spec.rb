require 'plane'

describe Plane do
  let(:airport) { double(:airport, :land => true, :leave => true) }
  let(:airport_with_plane) { double(:airport, :leave => true, :check_for_plane => true) }
  let(:airport_without_plane) { double(:airport, :check_for_plane => false) }

  it 'can be told to fly to an airport' do
    subject.fly_to airport
    expect(subject.destination).to eq airport
  end

  it 'can be told to take off from an airport' do
    subject.take_off airport_with_plane
    expect(subject.destination).to eq nil
  end

  it 'won\'t take off from an airport that it is not parked at' do
    expect{subject.take_off airport_without_plane}.to raise_error 'Not parked at airport'
  end

end
