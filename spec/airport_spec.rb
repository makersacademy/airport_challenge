require 'airport'

describe Airport do 
  it 'receives passengers' do
    expect(subject).to respond_to :passengers_arrive
  end 
end 
