require 'airport'

describe Airport do
  it 'is an instance of airport' do
    expect(subject).to be_an_instance_of Airport
  end
  it 'docks planes that have landed' do
    plane = double :plane
    subject.dock plane
    expect(subject.planes.include? plane).to eq true
  end
end