require 'plane'

describe Plane do

  it 'responds to the method landed' do
    expect(subject).to respond_to(:landed?)
  end

end
