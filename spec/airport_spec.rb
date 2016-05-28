require 'airport'
describe Airport do
subject(:airport) {airport = Airport.new}

it {should respond_to(:land)}

end