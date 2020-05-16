require 'airport'

describe Airport do
  it 'responds to #land plane' do 
    expect(subject).to respond_to(:land).with(1).argument
  end
end
