require 'plane'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

describe Plane do

  it { is_expected.to respond_to(:flying?) }

  it 'knows if it is flying' do
    expect(subject.flying?).to eq true
  end
  # it 'cannot take off while flying'
  # it 'cannot land while grounded'
  # it 'cannot take off from an airport it isn\'t at'
end
