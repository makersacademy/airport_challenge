require 'weather'
describe Weather do
  it 'is normally not stormy' do
    expect(subject.stormy?).to eq false
  end
end
