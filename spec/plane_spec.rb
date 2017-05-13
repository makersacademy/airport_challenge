require 'plane'

describe Plane do

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :depart }

  it 'lands' do
    expect(subject.land).to eq subject
  end

  it 'departs' do
    expect(subject.depart).to eq subject
  end

end
