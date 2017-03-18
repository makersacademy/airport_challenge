require './docs/plane.rb'

describe Plane do
  it 'creates an instance of the Plane class' do
    expect(subject).to eq(subject)
  end
  it {is_expected.to respond_to :land}
end
