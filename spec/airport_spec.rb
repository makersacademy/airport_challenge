require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  it 'is an airport' do
    expect(airport).to be_instance_of(Airport)
  end

end
