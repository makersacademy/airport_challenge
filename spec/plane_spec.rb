require 'plane'

describe Plane do
  it 'has an aircraft ID' do
    expect(subject).to respond_to(:plane_id)
  end
end
