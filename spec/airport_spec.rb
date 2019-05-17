require_relative '../docs/airport'

describe Airport do
let(:airport) { Airport.new }

  it 'creates a new instance of airport' do
    expect(airport).to be_an_instance_of(Airport)
  end
end
