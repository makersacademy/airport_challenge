require './lib/airplane'
require './lib/airport'
describe Airport do
  it 'instructs plane to land' do
    plane = Airplane.new
    subject.land(plane)
    expect(subject.inventory).to include(plane)
  end
  it 'checks plane is gone' do
    plane = Airplane.new
    subject.land(plane)
    subject.fly(plane)
    expect(subject.inventory).to eq([])
  end
  it 'will not land when no space' do
    plane = Airplane.new
    subject.capacity.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error 'no room'
  end
end
