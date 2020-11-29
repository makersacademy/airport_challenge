## Natasha's Airport Challenge Readme ##

## My approach to the airport challenge
Perform the following steps for each user story:
1. Draw a diagram modelling the user story
2. Write a feature test in irb to test the story from the user's perspective
3. Write an rspec test to drive the development
4. Write code to pass the test
5. Check rspec, irb, rubocop. Fix any issues.
6. Commit and push

Some user stories contained quite a lot, such as user story 4. The system designer has requested a default capacity that can be overridden. I first updated the tests then the code to allow for more than one plane (ie an array). Next I added a default capacity (arbitrarily chose the number 10 since no default capacity was provided). After this I updated it appropriately to allow it to be overridden.
