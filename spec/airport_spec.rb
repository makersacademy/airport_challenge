require 'airport'

describe Airport do

  it 'responds to full?' do
    expect(subject).to respond_to(:full?)
  end

  it 'returns true or false' do
    airport = Airport.new
    expect(airport.full?).to eq(true).or eq(false)
  end

end
