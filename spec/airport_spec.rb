require 'airport'

describe Airport do
  it 'creates new airport object' do
    expect(Airport.new.is_a? Airport).to eq true
  end
end
