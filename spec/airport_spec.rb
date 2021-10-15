require_relative '../lib/airport'
CAPACITY = 30
DEFAULT_CAPACITY = 20
subject = Airport.new(CAPACITY)
describe Airport do
  it 'airport should have id' do
    expect(subject.id).to eq(1)
  end
  it 'airport should have a controller' do
    expect(subject.controller).to be_an_instance_of(Controller)
  end
  it 'airport should have plane specified landing capacity' do
    expect(subject.capacity).to eq(CAPACITY)
  end
  it 'airport should have plane default landing capacity if not capacity has been specified' do
    subject = Airport.new
    expect(subject.capacity).to eq(DEFAULT_CAPACITY)
  end
  it 'airport plane parking should be empty initially' do
    expect(subject.spaces).to eq(0)
  end
end
