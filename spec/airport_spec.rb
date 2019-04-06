require 'airport'

describe Airport do
  it { is_expected.to respond_to(:recieve_plane) }
  it { is_expected.to respond_to(:release_plane) }
  # describe '#land' do
  #
  # end

end
