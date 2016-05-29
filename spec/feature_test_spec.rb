require 'plane'
require 'airport'

describe 'Feature test' do
  let(:weather) { double :weather }
  before do
    allow(weather).to receive(:stormy?).and_return(false) # stub to prevent random behaviour
  end
  it 'works' do
    gatwick = Airport.new #create airport, which default capacity of 10 planes
    seahawk = Plane.new #create planes
    spitfire = Plane.new
    hellcat = Plane.new
    spitfire.land_at(gatwick,weather) #planes land at airport
    seahawk.land_at(gatwick, weather)
    seahawk.take_off_from(gatwick, weather) #plane takes off from airport
    expect(gatwick.check_for_landed(spitfire)).to eq true #test to confirm plane landed is at airport
    expect(gatwick.check_for_landed(seahawk)).to eq false #test to confirm plane landed then left, not at airport
    expect(gatwick.check_for_landed(hellcat)).to eq false #test to confirm plane never landed not at airport
    seahawk.land_at(gatwick, weather)
    expect{hellcat.land_at(gatwick, weather)}.not_to raise_error #landing planes raises no error
    seahawk.take_off_from(gatwick, weather)
    gatwick.capacity = 2 # set capacity of gatwick from 10 to 2
    expect{seahawk.land_at(gatwick, weather)}.to raise_error 'Airport is at full capacity' #airport is full so error is raised
    gatwick.capacity = 10 # set capacity of gatwick back to 10
    expect{seahawk.land_at(gatwick, weather)}.not_to raise_error #capacity changed, so no longer returns error
    allow(weather).to receive(:stormy?).and_return(true) #change the stub to return stormy weather
    expect{seahawk.take_off_from(gatwick, weather)}.to raise_error 'No planes can land or take off in a storm' #error raised due to storm
    
  end
end
