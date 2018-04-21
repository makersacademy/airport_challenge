require 'plane'

describe Plane do
  it 'can create a instance' do
    expect(Plane.new).to be_truthy
  end

  describe '#land' do
    it 'can instuct a plane to land in a aiport' do
      is_expected.to respond_to(:land).with(1).argument
    end

  end

end
