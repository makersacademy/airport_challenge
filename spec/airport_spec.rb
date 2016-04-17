require 'plane'

describe Airport do
let(:plane) { double(:plane)}

it 'Lets landing planes #park in apron' do
subject.park(:plane)
end

end
