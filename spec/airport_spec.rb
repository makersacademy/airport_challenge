load 'airport.rb'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { spy :plane}

  it 'can land a plane' do
    is_expected.to respond_to(:land)
  end





end