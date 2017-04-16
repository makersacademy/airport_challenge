require 'plane'
require 'airport'

describe 'Feature test' do
  let(:weather) { double :weather }
  before do
    allow(weather).to receive(:stormy?).and_return(false) # stub to prevent random behaviour
  end
  it 'works' do
    #create airport, which default capacity of 10 planes
    gatwick = Airport.new(2)
    #create planes
    seahawk = Plane.new
    spitfire = Plane.new
    hellcat = Plane.new
    #planes land at airport
    spitfire.land_at(gatwick,weather)
    seahawk.land_at(gatwick, weather)
    #plane takes off from airport
    seahawk.take_off_from(gatwick, weather)
    #test to confirm plane landed is at airport
    expect(gatwick.check_for_landed(spitfire)).to eq true
    #test to confirm plane landed then left, not at airport
    expect(gatwick.check_for_landed(seahawk)).to eq false
    #test to confirm plane never landed not at airport
    expect(gatwick.check_for_landed(hellcat)).to eq false
    #landing planes raises no error due to default capacity of 2
    seahawk.land_at(gatwick, weather)
    #landing a 3rd plane raises error due to default capacity of 2
    expect{hellcat.land_at(gatwick, weather)}.to raise_error 'Airport is at full capacity'
    #change the stub to return stormy weather
    allow(weather).to receive(:stormy?).and_return(true)
    #error should be raised due to storm
    expect{seahawk.take_off_from(gatwick, weather)}.to raise_error 'No planes can land or take off in a storm'
  end
end
