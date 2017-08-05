require './docs/airport.rb'

describe Airport do
  {is_expected.to respond_to :land}
end

subject(:airport) { described_class.new}
let(:planez) { double :planez}

it "plane has left airport after take off"
 allow(:planez).to receive(:take_off)
 airport.take_off(planez)
 expect (airport.planes).to include plane
end
