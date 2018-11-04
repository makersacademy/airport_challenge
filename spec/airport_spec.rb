require 'airport'

describe Airport do

  it 'instruct plane to land at airport' do
    expect(subject.land).to eq 'land'
  end

  it 'instructs plane to take off' do
    expect(subject.take_off).to eq "plane has taken off and no longer at airport"
  end
end
