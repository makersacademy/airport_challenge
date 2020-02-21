require 'airport'

describe Airport do
  it 'allows plans to land' do
    expect(Airport.new).to respond_to(:land).with(1).argument
  end

end
