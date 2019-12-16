use v6;

sub MAIN(
  Str $file where *.IO.slurp = './input.txt' #= Input for Day 2, to calculate.
) {
  my @oplist = Process($file);
  say PartOne(@oplist);
  say PartTwo();
}

sub Process($file) {
  # Read file, splits on a comma and load into an array.
  return Array.new($file.IO.lines.split(','));
}

sub PartOne(@oplist) {
  # Pointer to keep the state of the program.
  my Int $pointer = 0;
  while (True) {
    # Checks the OPCodes
    given @oplist[$pointer] {
      # OPCode 1 adds a number
      when 1 {
        @oplist[@oplist[$pointer+3]] = @oplist[@oplist[$pointer+1]] + @oplist[@oplist[$pointer+2]];
      }
      # OPCode 2 multiplies a number
      when 2 {
        @oplist[@oplist[$pointer+3]] = @oplist[@oplist[$pointer+1]] * @oplist[@oplist[$pointer+2]];
      }
      # OPCode 99 quits the program
      when 99 {
        return @oplist[0];
      }
    }
    $pointer += 4;
  }
}

sub PartTwo() {
  my List @noun = ();
  my List @verb = ();
  my Int $output = 0;
  while ($output != 19690720) {
    my @oplist = Array.new('./input.txt'.IO.lines.split(','));
    my Int $randNoun = 100.rand.floor;
    my Int $randVerb = 100.rand.floor;
    @oplist[1] = ($randNoun ∈ @noun) ?? 100.rand.floor !! $randNoun;
    @oplist[2] = ($randVerb ∈ @verb) ?? 100.rand.floor !! $randVerb;
    $output := PartOne(@oplist);
    if ($output == 19690720) {
      return "noun=" ~ @oplist[1] ~ "& verb=" ~ @oplist[2];
    } else {
      say "It's not " ~ "noun=" ~ @oplist[1] ~ "& verb=" ~ @oplist[2] ~ " which gets an output of " ~ $output;
      # @noun.push(@oplist[1]);
      # @verb.push(@oplist[2]);
    }
  }
}
