# Benchmarks for Julia and Octave

Tests by Aiden Hall, Will Price, Dustin Zentz
framework by Aiden Hall

### Umass Amherst Math 552
Yay Numerics!

### Adding benchmarks
You will want to add benchmarks to this, here's a few words on how, and the rules

##### Adding the Benchmark Code
Just keep the julia files in the julia folder, and the octave files in the octave folder. 

##### Output Format
If you want to add a benchmark you NEED to follow these instructions:
each benchmark is separated by two newlines, and first line of benchmark output is the title. Each line thereafter is either input or output, such that each line of input is followed by all the output generated on that input. The number of lines of output for a given input cannot vary, or the parser won't function properly. If your output contains more than one line per input, you have to tell the parser how to group these by modifying the script. Trust me, it's not as bad as it sounds, I promise. You can do that by going inside the parser (the python script) and changing the global variable 'lens', just add the title of your benchmark as a key and add how many lines the output consists of as the value.

##### Running the Benchmark
You will need to add your benchmark to the bash script 'benchmarks.sh'. to do this, write
```bash
bench title iterlen julia_file octave_file arg1 arg2 ...
```
Next to the other bench calls. arg1 and arg2 will be passed to both of your benchmark files after the iteration number, which is the first arg.
