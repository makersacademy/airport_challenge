# Airport Challenge
- Write a software to control the flow of planes at an airport

## Lbearning Objectives
- Test drive the creation of a set of classes/modules to satisfy user stories
- Learn how to use a test double 

## Specification
- Planes can land and take off **if the weather is sunny**
- Use a random number generator to set the weather
- Use a stub to override random weather to ensure consistent test behaviour
- Defend against edge cases:
-- planes can only take off from airports they are in 
-- planes that are already flying cannot take off and/or be in an airport
-- planes that are landed cannot land again and must be in an airport
- Create separate files for every class, module and test suite
- (Bonus) Write an Rspec feature test that lands and takes off a number of planes

## Passing criteria
- All tests passing
- High test coverage (>95%)
- Elegant code: every class has a clear responsibility, methods are short etc.

## Process
- [Working Diagram](https://miro.com/app/board/o9J_ldPBBp0=/)