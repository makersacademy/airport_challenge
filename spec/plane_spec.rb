require 'plane'

describe Plane do

  subject(:plane) { Plane.new }

  it 'exits' do
    expect(subject).not_to eq nil
  end

end
