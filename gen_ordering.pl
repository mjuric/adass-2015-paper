#!/usr/bin/perl
#
# Scrapes the input file for appearances of \useaffil and generates a new
# block to be pasted into the tex file
#

# Find all appearances of \useaffil that are not preceded by a \def
$text = do { local $/; <> };
@uses = ($text =~ /(?<!\\def)(\\useaffil\w+)/g);
%seen = {};

# Generate a new \def\useaffil block, in order of appearance of affiliations
# in the author list
%seen = ();
foreach my $x (@uses)
{
  print "\\def" . "$x" . "{{" . (scalar(keys(%seen))+1) . "}}\n" if not exists $seen{$x};
  $seen{$x} = 1;
}
