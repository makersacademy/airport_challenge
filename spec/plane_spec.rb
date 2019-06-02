require './lib/plane'

describe Plane do
  it 'be flying' do
    expect(Plane.new.flying?).to eq(true)
  end

end
