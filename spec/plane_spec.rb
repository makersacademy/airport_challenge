require 'plane'

describe Plane do
  let(:airport_with_plane) { double(:airport, :leave => true, :check_for_plane => true) }
  let(:airport_without_plane) { double(:airport, :land => true, :check_for_plane => false) }

  it 'can is not airborne at first' do
    expect(subject.airborne).to eq false
  end

  it 'reports that it is not airborne after being instructed to land at an airport' do
    subject.take_off airport_with_plane
    subject.fly_to airport_without_plane
    expect(subject.airborne).to eq false
  end

  it 'reports that it is airborne after being told to take off' do
    subject.take_off airport_with_plane
    expect(subject.airborne).to eq true
  end

  it 'can is not airborne at first' do
    expect(subject.airborne).to eq false
  end

  it 'can be told to fly to an airport' do
    subject.take_off airport_with_plane
    subject.fly_to airport_without_plane
    expect(subject.destination).to eq airport_without_plane
  end

  it 'won\'t fly to an airport that it is already at' do
    expect{subject.fly_to airport_with_plane}.to raise_error 'Already at airport'
  end

  it 'can be told to take off from an airport' do
    subject.take_off airport_with_plane
    expect(subject.destination).to eq nil
  end

  it 'won\'t take off from an airport that it is not parked at' do
    expect{subject.take_off airport_without_plane}.to raise_error 'Not parked at airport'
  end

  it 'can\'t be told to take off if it is already airborne' do
    subject.take_off airport_with_plane
    expect{subject.take_off airport_with_plane}.to raise_error 'Already in the air'
  end

  it 'can\'t be told to land if it is not airborne' do
    expect{subject.fly_to airport_without_plane}.to raise_error 'Not in the air'
  end

end
