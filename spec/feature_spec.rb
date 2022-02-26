require_relative '../lib/plane'
require_relative '../lib/airport'

#why does subject work when the title in describe is not a class
describe 'landing some planes at an airport' do
  it 'creates an airport and lands a plane' do
    xwing = Plane.new
    malpensa = Airport.new
    malpensa.land(xwing)
    expect(malpensa.hangar).to eq [xwing]
  end
  
  it 'stops a plane from flying due to a storm, then lets it fly off on the second attempt as skies have cleared' do
    allow(subject).to receive(:stormy?).and_return(false,true,false)
    xwing = Plane.new
    subject.land(xwing)
    expect { subject.take_off }.to raise_error "grounded due to storm"    
    expect(subject.take_off).to be_a Plane
  end
  
  it 'stops a plane from landing due to a storm, then lets it land on the second attempt as skies have cleared' do
    allow(subject).to receive(:stormy?).and_return(true,false)
    xwing = Plane.new    
    expect { subject.land(xwing) }.to raise_error "Cannot land due to storm"    
    expect(subject.land(xwing)).to be_a Array
  end    
  
  describe 'Airport with a bigger capacity'
  subject{Airport.new(capacity)}
  let(:capacity) {15}
  it 'checks that the 16th plane will not fit in the bigger airport' do
    allow(subject).to receive(:stormy?){ false }
    15.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error "hangar is full"
  end
  
  
end
