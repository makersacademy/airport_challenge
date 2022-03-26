require_relative '../lib/airport'

describe Airport do
  let(:heathrow) { Airport.new }

  it 'has a hangar to store planes' do
    expect(heathrow.hangar).to eq []
  end
end
