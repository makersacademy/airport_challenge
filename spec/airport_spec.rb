require 'airport'

describe Airport do
  it 'can land a plane at the airport' do
    expect(subject.land).to eq true
  end
end
