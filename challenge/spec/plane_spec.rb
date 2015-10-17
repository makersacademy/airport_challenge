require 'plane.rb'

describe Plane do
  let (:airport) {double :airport}

  it 'is not flying when it is initialized' do
    expect(subject.flying_status).to eq false
  end

  it 'is in an airport when it is initialized' do
    expect(subject.in_airport).to eq true
  end

  it 'cannot be flying when in an airport' do
    expect{subject.is_flying}.to raise_error 'The plane is in an airport so cannot fly'
  end
end