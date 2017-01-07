require 'plane'

describe Plane do

  it 'responds to the method landed' do
    expect(subject).to respond_to(:landed?)
  end

  it 'responds to the method taken-off' do
    expect(subject).to respond_to(:taken_off?)
  end

end
