
Edge cases
- Random number generator to set the weather - Done
- Stub to override random whether for tests - Done (I think!)
- Planes should only take off from airports they're in - Done
- Planes already flying cannot take off - Done
- Planes already flying cannot be in an airport - Done by implication?
- Planes that are landed cannot land again - Done
- Planes that are landed must be in an airport - Done by implication?



NB - Consider land/takeoff methods on airport, not ATC?
Consider returning an array of planes when the land method called
Consider returning the plane when takeoff. 


plane = double('a plane')

Feature test (in rspec) -> unit test (in rspec) -> fail -> pass -> refactor (loop) --> pass feature test --> refactor -> repeat

subfolders in spec folder:
features
units 




**I can TDD anything:**
- `airport_spec.rb` for evidence of doubles and stubbing (e.g. lines 7, 39 and 53)
- `airport_feature_spec.rb` for evidence of automated feature testing (only weather is stubbed for consistency)

**I can program fluently / I write code that is easy to change**
- Use of dependency injection so that `Airport` is agnostic about how it gets its weather (`airport.rb`, line 10)
- Removal of implementation detail into private methods, so that third parties using our public interface won't be disturbed by future changes (e.g. `airport.rb` e.g. lines 24-25 hides details of how a plane is added to an airport)

**I can refactor anything**
- Changelog and approach in readme: multiple refactorings to switch to doubles, stubs and clean up the code

**I help my teams succeed**
- Mention in readme for help with topic e.g. [here](https://github.com/nkhil/airport_challenge/blob/master/README.md#acknowledgments)



What parts (what files, line numbers, tests etc) of your code or what elements of your commits do you think show evidence of this goal?