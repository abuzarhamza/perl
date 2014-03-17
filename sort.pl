#!/usr/bin/perl

print "input the array :\n";
my $input =<STDIN>;
chomp($input);
my @input = split(" ",$input);
#bubbleSort(\@input);
#insertionSort(\@input);
#selectionSort(\@input);

msort_number (@input);

print @input,"\n";


sub msort_number{
	my $size=@_;
	mergesort_number(\@_, 0, $size);
}



sub mergesort_number {
	my ($aref, $begin, $end)=@_;

	my $size=$end-$begin;

	if($size<2) {return;}
	my $half=$begin+int($size/2);

	mergesort_number($aref, $begin, $half);
	mergesort_number($aref, $half, $end);

	#merge array ($arr,$start,$half,$end)
	for(my $i=$begin; $i<$half; ++$i) {
		if($$aref[$i] > $$aref[$half]) {
			my $v=$$aref[$i];
			$$aref[$i]=$$aref[$half];

			my $i=$half;
			while($i<$end-1 && $$aref[$i+1] < $v) {
				($$aref[$i], $$aref[$i+1])=
					($$aref[$i+1], $$aref[$i]);
				++$i;
			}
			$$aref[$i]=$v;
		}
	}
}

#find the mininmum in the array and swap it when necessary 
sub selectionSort {
 my ($ref) = @_;
 my @input =  @$ref;
 for (my $i =0;$i<scalar(@input);$i++) {
   my $min = $i;
   #my $min = $input[$i];
   for (my $j = $i+1;$j<scalar(@input);$j++) {		
	if ($input[$j] < $input[$min]) {
		$min = $j;
        }
   }
   ($input[$i],$input[$min]) = ($input[$min],$input[$i]);
   print "selection : @input\n";
 }
 print ">>> final selection : @input\n";
	
}


sub insertionSort {

  my ($ref) =  @_;
   my @input = @$ref;
   for $i (1 .. $#input) {
     my $val = $input[$i];
     my $j = $i -1;
     while ($j >= 0  && $input[$j] > $val) {
       $input[$j+1]  = $input[$j];
       $j--;
     }
     $input[$j+1] = $val;
     print "insertion sort : @input\n";
   }
   print ">> final insertion @input\n";

}




sub bubbleSort {
my ($ref) =  @_;
my @input = @$ref;
for my $i (0..$#input) {
 for my $j ($i+1 .. $#input) {
        #2 19 4
        #print "j : $input[$j] : i : $input[$i]\n";
	if ($input[$j] < $input[$i]) {
		#$input[$i,$j] = $input[$j,$i];
		$temp = $input[$i];
		$input[$i] = $input[$j];
                $input[$j] = $temp;
        }
 }
 print "bubble sort : @input\n" ;
}

print ">> final bubble : @input\n";
}
