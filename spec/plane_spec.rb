require 'plane'

describe Plane do
  it 'responds to' do
    expect(subject).to respond_to :active?
  end
end