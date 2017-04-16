require 'airport'

describe Airport do
  it { expect(subject).to respond_to :release_plane }

  it { is_expected.to respond_to(:land).with(1).argument }

end
