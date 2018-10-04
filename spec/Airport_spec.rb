require './Airport.rb'

describe Airport do
  it 'exists' do
    expect(subject).to respond_to(Airport.new).with(1).argument
  end
end