If a group of tests share the same setup or are related logically, group them in a `context` block or a `describe` block.  Use `describe` when the tests are related by a subset of behaviour (e.g 'landing') and use `context` when the tests are related by program state (e.g. 'when it is stormy').

`let`, `subject` and `before` statements inside a context or describe block will only run for tests inside the block and will override similar statements in an outer block.
