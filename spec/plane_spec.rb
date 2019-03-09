require 'plane'

describe Plane do

  it 'creates new plane object' do
    expect(Plane.new.is_a? Plane).to eq true
  end

  it { is_expected.to respond_to(:land) }
  
end
