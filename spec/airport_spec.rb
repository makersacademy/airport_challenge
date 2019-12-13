require 'airport'

describe Airport do
  it 'can cereate an instance of an airport' do
    ap = Airport.new
    expect(ap).to be_a Airport
  end

  it 'responds to land method' do
    expect(subject).to respond_to(:land).with(1).argument
  end
end
