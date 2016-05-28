require 'plane'

describe Plane do

  it 'responds to land' do
    expect(subject).to respond_to :land
  end

  it 'responds to take off' do
    expect(subject).to respond_to :take_off
  end

end
