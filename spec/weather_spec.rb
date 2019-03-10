require 'weather'
describe Weather do
  it 'the weather can be changed to stormy' do
    subject.stormy = true
    expect(subject.stormy?).to eq true
  end
end
