require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land_plane) }

  it 'should check if landed planes have landed' do
    expect(subject.land_plane).to be_landed
  end
end
