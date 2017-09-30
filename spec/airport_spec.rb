require 'airport'

describe Airport do

  it 'clears plane for take off' do
    expect(Airport.new).to respond_to :clear?
  end

end