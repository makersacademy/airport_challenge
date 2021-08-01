require 'airport'

describe Airport do

  it 'instructs planes to land at airport' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'instructs planes to take off at airport' do
    expect(subject).to respond_to(:takeoff).with(1).argument
    
  end
  
end
