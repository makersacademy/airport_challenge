require_relative "../lib/plane"

describe Plane do
  it 'can land' do
    expect(subject).to respond_to(:land).with(1).argument
  end
# refactor the below
  it 'can land at an airport' do
    expect(subject.land("airport")).to eq true
  end
end
