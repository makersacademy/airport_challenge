require './lib/airport.rb'

describe Airport do
  it 'responds to a command to land' do
    expect(subject).to respond_to :land
  end
end

# 1. 
# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport