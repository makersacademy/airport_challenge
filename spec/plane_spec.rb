require 'plane.rb'

describe Plane do
  let (:airport) {double :airport}

  it 'is flying when it is initialized' do
    expect(subject.flying_status).to eq true
  end

  it 'is not in an airport when it is initialized' do
    expect(subject.in_airport).to eq false
  end
end