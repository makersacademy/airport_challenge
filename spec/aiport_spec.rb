require 'airport'

describe Airport do
  it 'should respond to #status' do
    expect(subject).to respond_to(:status)
  end

  it 'should provide capacity when responding to #status' do
    expect(subject.status).to eq(subject.capacity)
  end
end
