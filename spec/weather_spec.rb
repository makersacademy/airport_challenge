require 'weather'

describe Weather do

  it 'should respond to #status' do
    expect(subject).to respond_to :status
  end

end
