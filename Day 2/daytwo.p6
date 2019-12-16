use v6;

sub MAIN(
  Str $file where *.IO.slurp = './input.txt' #= Input for Day 2, to calculate.
) {
  my @oplist = Process($file);
  say PartOne(@oplist);
  say PartTwo(@oplist);
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

sub PartTwo(@oplist) {
  say @oplist;
  # my Int $output = 0;
  # while ($output != 19690720) {
  #   my Int $tempNoun = (1^..99).rand.floor;
  #   my Int $tempVerb = (1^..99).rand.floor;
  #   @oplist[1] = $tempNoun;
  #   @oplist[2] = $tempVerb;
  #   $output = PartOne(@oplist);
  #   if ($output == 19690720) {
  #     return "noun=" ~ $tempNoun ~ "& verb=" ~ $tempVerb;
  #   }
  # }
}
