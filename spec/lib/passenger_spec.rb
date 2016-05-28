require 'passenger'

describe Passenger do
  it 'can be instantiated' do
    expect(Passenger.new.class).to eq Passenger
  end
end