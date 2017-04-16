require 'weather'

describe Weather do
  it { is_expected.to respond_to :stormy? }

  it 'should check if stormy' do
    expect(subject.stormy?).to eq(true).or(eq(false))
  end

it 'checks if sunny' do
  allow(subject).to receive(:rand){1}
  expect(subject.stormy?).to eq false
end

  it 'checks if storm' do
    allow(subject).to receive(:rand){5}
    expect(subject.stormy?).to eq true
  end

end
