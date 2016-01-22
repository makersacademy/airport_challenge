require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double :plane}

  it{is_expected.to respond_to(:sunny?)}
  # Airport should be able to use Weather methods via module inclusion

end
