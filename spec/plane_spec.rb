require 'Plane.rb'

describe Plane do

  it 'plane can be named' do
    boeing = Plane.new("747")
    expect(boeing.name).to eq("747")
  end

end
