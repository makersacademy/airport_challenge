require 'plane'

describe Plane do
  it 'Creating a new plane should save the model' do
    boeing = Plane.new('Boeing')
    expect(boeing.model).to eq 'Boeing'
  end
end
