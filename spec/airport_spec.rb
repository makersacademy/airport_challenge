require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double(:plane)}

  it 'allows the creation of an airport' do
    array = []
    array << airport
    expect(array).to eq [airport]
  end

  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:planes)}

end
