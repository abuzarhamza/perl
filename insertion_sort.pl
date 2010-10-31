#!/usr/bin/perl -w
use strict;

print "enter the list of unsorted number :";
my $input=<STDIN>;
chomp($input);
my @unsort=split(' ',$input);
my $unsort = insertion_sort(@unsort);


@sort = @$unsort;

print "sort : @unsort\n";


sub insertion_sort {
	my @unsort = @_;
	my $length_array = scalar(@unsort) - 1;
	for (my $j = 0; $j<=$length_array;$j++){
		my $key = $unsort[$j];
		my $i = $j - 1;
		while(($i>-1) && ($unsort[$i]>$key)){
			$unsort[$i+1] = $unsort[$i];
			$i = $i -1;
		}
		$unsort[$i+1] = $key;
	}
	return (\@unsort);
}
