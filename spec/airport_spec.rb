require "airport"

describe Airport do
  it 'instruct plane to land' do
    expect(subject.instruct).to eq land
  end
end