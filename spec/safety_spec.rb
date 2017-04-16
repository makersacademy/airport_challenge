require 'safety'
describe Safety do

  before do
    allow_any_instance_of(Weather).to receive(:status) { "sunny" }
  end

end  
