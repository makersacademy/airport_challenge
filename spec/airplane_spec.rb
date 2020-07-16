require 'airplane'

describe Airplane do
  it 'returns it is working' do
    subject.working?
    expect(subject).to be_working
  end
end
