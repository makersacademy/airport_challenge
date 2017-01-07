require 'airport'

describe Airport do
  it 'should assign a default capacity when initialised' do
    get :initialize
    assigns(:capacity).should_not be_nil
  end
end
