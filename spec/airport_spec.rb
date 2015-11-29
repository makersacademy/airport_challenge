require 'airport'

describe Airport do
  it 'states how many planes are at the airport' do
    expect(subject).to respond_to(:planes_on_ground)
  end

  it 'can tell if it is full' do
    expect(subject).to respond_to(:full?)
  end

end
