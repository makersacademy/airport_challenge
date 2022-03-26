require_relative '../lib/airport'

describe Airport do
  let(:airport) { Airport.new }

  it 'can store planes' do
    expect(airport.hangar).to eq []
  end
end
