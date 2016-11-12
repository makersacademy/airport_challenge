require './lib/airport'

describe Airport do

  it 'responds to release_plane' do
    expect(subject).to respond_to :release_plane
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:plane) }

  it 'lands a plane' do
    expect(subject.land(@plane)).to eq @plane
  end

  it 'confirms planes have landed' do
    subject.land(@plane)
    expect(subject.plane).to eq @plane
  end

end
