#!/usr/bin/perl -w
use strict;

print "enter the list of unsorted number :";
my $input=<STDIN>;
chomp($input);
my @unsort=split(' ',$input);
my $unsort = insertion_sort(@unsort);
my @sort = @$unsort;
print "sort : @sort\n";
$unsort =sort_inverse(@unsort);
@sort = @$unsort;
print "sort : @sort\n";




sub insertion_sort {
	my @unsort = @_;
	my $length_array = scalar(@unsort) - 1;
	for (my $j = 1; $j<=$length_array;$j++){
		my $key = $unsort[$j];
		my $i = $j - 1;
		while(($i>-1) && ($unsort[$i]>$key)){
			$unsort[$i+1] = $unsort[$i];
			$i = $i -1;
			
		}
		$unsort[$i+1] = $key;
						
	}
	#print "==>@unsort\n";
	return (\@unsort);
}


sub sort_inverse {
	#4 2 6 5 
	my @unsort =@_;
	my $length_array = scalar(@unsort) -1;
	for (my $j = 1;$j<=$length_array;$j++){#1,2
		my $key = $unsort[$j]; #2,6
		my $i = $j-1; #0,1
		while(($i>-1) && ($unsort[$i]<$key)){ #4<2,2<6,4<6
			$unsort[$i+1]= $unsort[$i];#[1]=4,[2]=6,[1]=4,
			$i = $i-1;#-1,0	,-1
			
		}
		$unsort[$i+1] = $key;#[2]=2
			
					
	}
	#print "===========>@unsort\n";
	return (\@unsort);
}
