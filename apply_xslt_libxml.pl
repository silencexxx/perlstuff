# apply xslt

use strict; 
use XML::LibXML;
use XML::LibXSLT; 
my $parse = XML::LibXML->new(); 
my $xslt = XML::LibXSLT->new(); 

my $xml = $parse->parse_file(@ARGV[0]); 
my $input = $parse->parse_file(@ARGV[1]); 


my $xslt = $xslt->parse_stylesheet($input); 
my $result = $xslt->transform($xml); 
my $html = $xslt->output_string($result); 

print $html; 



