It's easy to use `let` or `subject` or to create a local variable to refer to the class under test.  However, prefer instead to [name the subject explicitly](https://www.relishapp.com/rspec/rspec-core/docs/subject/explicit-subject), using `described_class` to refer to the class:

```ruby
describe Airport do
  subject(:airport) { described_class.new }
end
```

Instead of:

```ruby
describe Airport do
  let(:airport) { Airport.new }

  # or:
  it 'does something' do
    airport = Airport.new
  end
end
```