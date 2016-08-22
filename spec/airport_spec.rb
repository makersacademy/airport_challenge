require 'airport'

describe Airport do
  it 'returns true if land method exists' do
    expect(Airport.new.respond_to?('land')).to eq true
  end
end
