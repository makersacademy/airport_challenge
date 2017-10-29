require './lib/airport.rb'

describe Airport do
it { expect(Airport.new).to respond_to(:land) }

end
