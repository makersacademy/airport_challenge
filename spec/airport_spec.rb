require 'airport'

describe Airport do

  it 'responds to allows_for_landing' do
    expect(subject).to respond_to :allows_for_landing
  end

end
