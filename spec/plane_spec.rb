require 'plane'

describe Plane do
  it { is_expected.to respond_to(:land) }
  it 'should return landed status' do
    expect(subject.land).to eq 'The plane has landed!'
  end
end
