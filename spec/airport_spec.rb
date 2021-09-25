require 'airport'

describe Airport do
  it 'responds to the method full?' do
    expect(subject).to respond_to(:full?)
  end
end

describe "#full" do
  it 'tells us if the airport has any planes in it' do
    newAirport = Airport.new
    expect(newAirport.full?).to eq 0 
  end
end
