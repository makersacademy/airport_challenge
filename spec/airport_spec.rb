require 'airport'

describe Airport do
  it 'can create instances of Airport' do
   expect(Airport.new("Heathrow")).to be_a_kind_of(Airport)
  end
  # it { is_expected.to respond_to(:plane_landing).with(1).argument }

end
