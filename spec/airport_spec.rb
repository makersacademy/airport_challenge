require 'airport'

describe Airport do
  it 'responds to instruct_to_land method' do
    expect(subject).to respond_to(:instruct_to_land).with(1).argument
  end
end
