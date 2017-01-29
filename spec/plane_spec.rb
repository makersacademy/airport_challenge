require './lib/plane'

describe Plane do

  it {is_expected.to respond_to :status?}
  it {is_expected.to respond_to :landed}
  it {is_expected.to respond_to :departed}

  it 'returns the plane Object\'s status' do
    expect(subject.status?).to eq("Airborne.")
  end

  it 'sets the plane Object\'s status to departed' do
    expect(subject.departed).to eq("Plane departed.")
  end

  it 'sets the plane Object\'s status to landed' do
    expect(subject.landed).to eq("Plane landed.")
  end

end
