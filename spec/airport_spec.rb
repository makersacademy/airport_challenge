require 'airport'

describe Airport do

  airplane = Airplane.new

  #TDD Step 1
  it 'instructs plane to land at airport' do
    allow(airplane).to receive(:land)
    expect(subject.land(airplane)).to include(airplane)
  end
end
