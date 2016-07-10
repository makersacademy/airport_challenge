require 'weather'

describe Weather do

  subject (:weather) { described_class.new }

  it 'should be stormy occasionally' do
    allow(weather).to receive(:stormy?).and_return(true, false)
    expect(subject.stormy?).to eq(true)
    expect(subject.stormy?).to eq(false)
  end
end
