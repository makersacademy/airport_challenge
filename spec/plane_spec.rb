require 'plane'

describe Plane do

  it 'confirms the plane is airborne' do
    expect(subject).to respond_to :status
  end
end
