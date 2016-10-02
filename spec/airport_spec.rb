require 'airport'

describe Airport do
  it 'has weather conditions' do
    expect(subject).to respond_to :weather
  end
end