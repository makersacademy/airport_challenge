require 'plane'

describe Plane do
  subject { Plane.new }

  it 'responds to land method with one argument' do
    expect(subject).to respond_to(:land)
  end 

end
