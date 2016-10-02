require 'plane'

describe Plane do
  it 'takes off' do
    expect(subject).to respond_to :take_off
  end
end
