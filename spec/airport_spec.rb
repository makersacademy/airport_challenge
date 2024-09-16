require 'airport'

describe Airport do
  it 'has a variable capacity' do
    biggin_hill = Airport.new(25)
    expect(biggin_hill.capacity).to eq 25
  end

  

end
