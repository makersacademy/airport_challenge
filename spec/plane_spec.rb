require 'plane'

describe Plane do

  it 'expects the plane to arrive at airport' do
    expect(subject.arrive_at_airport).to eq true
  end

  it 'expects the plane to depart from airport' do
   expect(subject.depart_from_airport).to eq true
  end

  it 'expects stormy_weather? to return Integer' do
    expect(subject.stormy_weather?).to be_a_kind_of(Integer)
  end


end
