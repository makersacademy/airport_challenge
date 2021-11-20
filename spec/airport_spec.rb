require 'airport'

describe Airport do
  it 'has a method to take off' do 
    expect(Airport.new).to respond_to(:take_off)
  end    

end
