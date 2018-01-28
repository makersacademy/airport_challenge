## Airport Challenge ##

I approached this challenge as did in the course, by breaking down the user stories into individual objects and the methods associated they should be responsible for.
Once I had the core of the system in place, I used feature testing in IRB to work out the possible edge cases and add error handling for them where appropriate

Some particular issues that arose
* Testing the value of an instance variable if it is changed by the method but not returned, and there is not a reader method available for it.
> This arose in Airport#take_off. In the end I decided it was reasonable to include attr_reader :planes to allow air traffic controllers to see the list of planes currently landed at the airport, but it is easy to see that there are scenarios where this might not be a solution.

* Best practice for testing that a boolean is returned but not the specific value.
>Currently I am just using
```expect(method_under_test).to eq(true).or eq(false)
```

* The difference between including and requiring modules.
>Currently weather.rb is required at the top of the page and the line ```extend weather``` is included at the top of the Airport class, but I am not clear what best practice would be.

* Rubocop says that I do not have coverage of Airport#stormy? But all of the information I could find about testing private methods seemed clumsy.
