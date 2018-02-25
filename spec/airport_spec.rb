require 'airport'
describe Airport do

  # airport new (initialize) method check
  # it { should respond_to(:new) }

  # airport land method check
  it { should respond_to(:land) }
  # it { should respond_to(:land).with.(1).arguments }

  # airport take off method check
  it { should respond_to(:take_off) }
  # it { should respond_to(:take_off).with.(1).arguments }

  # airport prevent landing method check
  it { should respond_to(:prevent_landing) }

  # airport prevent take off method check
  it { should respond_to(:prevent_take_off) }
end
