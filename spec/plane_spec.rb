require 'plane'

describe Plane do

  it 'expects the plane to arrive at airport' do
    expect(subject.arrive_at_airport).to eq true
  end

  it 'expects the plane to depart from airport' do
   expect(subject.depart_from_airport).to eq true
  end

  it 'expects plane to confirm whether there is stormy weather' do
    expect(subject.stormy_weather?).to eq true
  end

  it { is_expected.to respond_to :stormy_weather?}

end
