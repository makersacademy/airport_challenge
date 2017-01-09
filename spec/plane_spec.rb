require './lib/plane'

describe Plane do

  it {is_expected.to respond_to :status?}
  it {is_expected.to respond_to :landed}
  it {is_expected.to respond_to :departed}

  it 'sets the plane Object\'s status to departed' do
    expect(subject.departed).to eq("Plane departed.")
  end


end
