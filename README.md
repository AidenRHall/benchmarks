# Benchmarks for Julia and Octave

### Tests by Aiden Hall, Will Price, Dustin Zentz - framework by Aiden Hall

### Math 552 Umass Amherst
Yay Numerics!

### Output Format
if you want to add a benchmark you need to follow this

tests are separated by two newlines, and the first line of test output should be the title. each line is either input or output, and each line of input is followed by all lines of output generated on that input. the number of lines of output cannot vary, or the parser won't function properly, and you have to tell it how to group these (ie how many lines of output to group together) for your tests. You can do that by directly modifying the parser globals (in the python script), just change the value associated with the title of your test.
