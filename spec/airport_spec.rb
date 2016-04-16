require 'airport'

describe Airport do
let(:airport) { described_class.new}

  it 'responds to plane landing' do
    expect(airport).to respond_to :land
  end

end