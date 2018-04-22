####What do you think you did well?

- I felt that breaking the User Stories into DOM went well and allowed me to ferret out the methods I needed with ease;
- I think that using `object.__id__` as a unique identifier worked well and removed the need to for a separate `status` method for planes;
- I think that I have managed to achieve isolated tests for each class fairly well - I used stubs and spies to make sure that I was passing the right messages around.

####What do you think was hard or confusing?

- Still trying to work out how to run a Feature Test in RSpec.
- I feel that my methods, particularly in the `Plane` class could be slimmed down/broken up but given their size and the small number of related tasks they were doing, I was not sure whether it was best to leave them as they were or to refactor. I need advice on this - what is the best practice here?
- Checking in RSpec whether the methods I wanted to be called were in fact called was a bit of a mission.
- Still don't know how to test private methods.
- I was trying to come up with a way to make `Airport` class in such a way that it would not require the `WeatherStation` class at all, since that created a dependency. What is the best method here - pass the WeatherStation instance as a parameter when creating an Airport instance (which is 'dependency injection' if I understand it correctly) or let the `Airport` class require `WeatherStation` from within. The reason I went with the second one is because it would be impossible to create a simple Airport if every time you had to make a WeatherStation and pass it to the Class. Need guidance on this.

####What do you want to improve on?

- Rspec: testing of private methods; doubles, spies and stubs; appropriate choice of matchers.
- OOP: Correct/best practices in relation to class construction, method construction, dependencies

####What would you work on if you had more time?

- RSpec feature test
- Improve tests and refactor tests
- Try different options for class construction and refactor methods