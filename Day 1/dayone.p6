use v6;

sub MAIN(
  Str $file where *.IO.slurp = './input.txt' #= Input for Day 1, to calculate.
) {
  PartOne($file);
  PartTwo($file);
}

sub PartOne(Str $file) {
  # Try One:
  # my $tally = Int;
  # for $file.IO.lines -> $line {
  #   $tally += (($line/3).floor)-2;
  # }
  # say $tally;
  # Try two:
  say "Part one: " ~ $file.IO.lines.map((*/3).floor-2).sum;
  say "Time to execute: " ~ (now - INIT now)
}

sub PartTwo(Str $file) {
  my Int $fuel = 0;
  for $file.IO.lines -> $line {
    my Int $remain = +$line;
    while ($remain > 0) {
      $remain = (($remain/3).floor-2 < 0) ?? 0 !! ($remain/3).floor-2;
      $fuel += $remain;
    }
  }
  say "Part two: " ~ $fuel;
  say "Time to execute: " ~ (now - INIT now)
}
