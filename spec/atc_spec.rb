require './lib/plane'
require './lib/atc'

describe 'Air Traffic Control' do
 before(:each) do
   @plane = Plane.new
   @ATC = Atc.new
 end

context 'Tells plane to land' do
 it 'checks to see if atc can tell plane to land'do
   expect(@ATC.land(@plane)).to eq true
  end
end

context "Tells plane to take off"do
  it 'checks to see if atc can tell plane to take off'do
    expect(@ATC.take_off(@plane)).to eq true
    end
  end

context 'Checks to see if plane has landed'do
  it 'checks to see if plane has landed'do
    @ATC.land(@plane)
    expect(@ATC.landed?(@plane)).to eq true
  end
end

context 'Checks to see if plane is in airport'do
  it 'checks to see if plane is in airport'do
    @ATC.take_off(@plane)
    expect(@plane.in_airport).to eq false
  end
end

end
