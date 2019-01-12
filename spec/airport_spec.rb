require 'airport'

RSpec.describe Airport do
  it 'instructs a plane to land' do
    plane = double('it is a plane')
    expect(subject.land(plane)).to eq [plane]
  end
  it 'instructs a plane to take off' do
    plane = double('it is a plane')
    subject.land(plane)
    subject.take_off
    expect(subject.take_off).to eq nil
  end
end
