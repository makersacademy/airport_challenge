require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  it 'creates a new plane' do
    expect(subject).to be_an_instance_of(Plane)
  end
  
end