require 'weather'

describe Weather do
  it 'reports inclement weather' do
    expect(subject.inclement?).to eq true
  end
end
