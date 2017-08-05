require 'plane'

describe Plane do

  let(:plane) { Plane.new }

  it { should respond_to(:working?) }

  it 'should be working' do
    plane.working?.should eq(true)
  end

end
