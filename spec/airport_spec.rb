require 'airport'

RSpec.describe Airport do
  it 'instructs a plane to land' do
    plane = double('it is a plane')
    expect(subject.land(plane)).to eq [plane]
  end
end
