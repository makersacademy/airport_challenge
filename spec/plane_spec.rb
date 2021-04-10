require 'plane'

describe Plane do
  it 'initializes with a status of flying' do
    expect(subject.status).to eq 'flying'
  end
end
