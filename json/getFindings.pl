#!/usr/bin/env perl
# Copyright 2014 Frank Breedijk
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ------------------------------------------------------------------------------
# Get a full list of findings associated with the filter parameters given
# ------------------------------------------------------------------------------

use strict;
use CGI;
use CGI::Carp qw(fatalsToBrowser);
use JSON;
use lib "..";
use SeccubusV2;
use SeccubusFindings;

my $query = CGI::new();
my $json = JSON->new();

print $query->header(-type => "application/json", -expires => "-1d", -"Cache-Control"=>"no-store, no-cache, must-revalidate");

my $workspace_id = $query->param("workspaceId");
my @scan_ids = $query->param("scanIds[]");

# Return an error if the required parameters were not passed 
if (not (defined ($workspace_id))) {
	bye("Parameter workspaceId is missing");
} elsif ( $workspace_id + 0 ne $workspace_id ) {
	bye("WorkspaceId is not numeric");
} elsif ( 0 == @scan_ids ) {
	bye("Scan_ids is a mandatory parameter");
};

eval {
	my @data;
	my %filter;
	foreach my $key ( qw( Status Host Hostname Port Plugin Severity Finding Remark Severity ) ) {
		if ($query->param($key) ne undef and $query->param($key) ne "all" and $query->param($key) ne "null" and $query->param($key) ne "*" ) {
			$filter{lc($key)} = $query->param($key); 
		}
	}

	foreach my $scan_id ( @scan_ids ) {
		my $findings = get_findings($workspace_id, $scan_id, \%filter);

		foreach my $row ( @$findings ) {
			push (@data, {
				'id'		=> $$row[0],
				'host'		=> $$row[1],
				'hostName'	=> $$row[2],
				'port'		=> $$row[3],
				'plugin'	=> $$row[4],
				'find'		=> $$row[5],
				'remark'	=> $$row[6],
		 		'severity'	=> $$row[7],
				'severityName'	=> $$row[8],
				'status'	=> $$row[9],
				'statusName'	=> $$row[10],
				'scanId'	=> $$row[11],
			});
		}
	}
	print $json->pretty->encode(\@data);
} or do {
	bye(join "\n", $@);
};

sub bye($) {
	my $error=shift;
	print $json->pretty->encode([{ error => $error }]);
	exit;
}
