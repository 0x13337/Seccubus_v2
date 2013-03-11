# ------------------------------------------------------------------------------
# Copyright 2013 Frank Breedijk
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
package SeccubusHelpers;

=head1 NAME $RCSfile: SeccubusHelpers.pm,v $

This Pod documentation generated from the module SeccubusHelpers gives a list
of all functions within the module.

=cut

#use SeccubusConfig;

@ISA = ('Exporter');

@EXPORT = qw ( 
		check_config
		dirlist
		api_error
		api_result
	);

use strict;
use Carp;
use HTML::Entities;

sub check_config();
sub dirlist($;$);
sub api_error($$);
sub api_result($;$$$);

=head2 check_config

This function checks the configuration file for obvious errors

=over 2

=item Parameters

=over 4

=item None

=back

=item Returns

True if the config is not obviously invalid

=item Checks

None

=back

=back

=cut

sub check_config() {
	my $ok = 1;
	my $config = SeccubusV2::get_config();
	if ( ! $config->{database}->{database} ) {
		confess "No DB configuration in config.xml";
		$ok = undef;
	}
	return $ok;
}

=head2 dirlist

This routine is stolen verbatim from Nikto. It lists the files in a directory 
that match a certain pattern.

=over 2

=item Parameters

=over 4

=item DIR - The directory begin listed

=item PATTERN - The regexp pattern these files should match

=back

=item Returns

An array of files that match the pattern

=item Checks

None

=back

=back

=cut

sub dirlist($;$) {
    my $DIR     = $_[0] || return;
    my $PATTERN = $_[1] || "";
    my @FILES_TMP = ();

    opendir(DIRECTORY, $DIR) || die print STDERR "+ ERROR: Can't open directory '$DIR': $@";
    foreach my $file (readdir(DIRECTORY)) {
        if ($file =~ /^\./) { next; }    # skip hidden files, '.' and '..'
        if ($PATTERN ne "") {
            if ($file =~ /$PATTERN/) { push(@FILES_TMP, $file); }
        }
        else { push(@FILES_TMP, $file); }
    }
    closedir(DIRECTORY);

    return @FILES_TMP;
}

=head2 api_error

This function prints a standard Seccubus API error message and exits the program

=over 2

=item Parameters

=over 4

=item api_name - Name of the api that returns the error

=item message  - Error message in the error output

=back

=item Returns

None

=item Checks

None

=back

=back

=cut

sub api_error($$) {
	my $api_name = shift;
	my $error_msg = shift;

	print "<seccubusAPI name='$api_name'>\n";
	print "<result>NOK</result>\n";
	print "<message>" . encode_entities($error_msg) . "</message>\n";
	print "</seccubusAPI>\n";
	exit;
}

=head2 api_result

This function prints a standard Seccubus API output message.

=over 2

=item Parameters

=over 4

=item api_name - Name of the api that returns the output

=item message  - Optional message in the output

=item data     - Optional data segment in the output

=item iserror  - Optional, indicates that the output is an error message, negative by default

=back

=item Returns

None

=item Checks

None

=back

=back

=cut

sub api_result($;$$$) {
	my $api_name = shift;
	my $msg = shift;
	my $data = shift;
	my $iserror = shift;

	if ( $iserror ) {
		$iserror = "OK";
	} else {
		$iserror = "NOK";
	}

	print "<seccubusAPI name='$api_name'>\n";
	print "<result>$iserror</result>\n";
	if ( $msg ) {
		print "<message>" . encode_entities($msg) . "</message>\n";
	}
	if ( $data ) {
		print "<data>\n$data\n</data>";
	}
	print "</seccubusAPI>\n";
	exit;
}
# Close the PM file.
return 1;
