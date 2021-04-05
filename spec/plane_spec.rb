require 'plane'

describe Plane do
  it { is_expected.to be_instance_of Plane }

  it 'returns a flying status when initialized' do
    expect(subject.flying?).to be true
  end

end
