require './lib/airport'

# describe Airport do
#   it { is_expected.to respond_to :release_plane}
# end

describe Airport do
  subject(:airport) { described_class.new }

it 'instructs a plane to land' do
  expect(subject).to respond_to(:land).with(1).argument

  end
end
