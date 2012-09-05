# ------------------------------------------------------------------------------
# $Id$
# ------------------------------------------------------------------------------
# Main Seccubus perl module. This module calls the other modules after some
# very basic housekeeping
# ------------------------------------------------------------------------------
package SeccubusV2;

=head1 NAME $RCSfile: SeccubusV2.pm,v $

This Pod documentation generated from the module SeccubusV2 gives a list of all 
functions within the module.

=cut

@ISA = ('Exporter');

@EXPORT = qw( 
		VERSION 
		get_config
	    );

use XML::Simple;
use Data::Dumper;

our $config = "config.xml";		# Change this value to match your setup
					# if your configuration file cannot be 
					# found
$config = "/home/seccubus/etc/config.xml" unless -e $config;
					# Bug #62 - /home/seccubus/etc missing
$config = "/etc/Seccubus/config.xml" unless -e $config;
$config = "/opt/Seccubus/etc/config.xml" unless -e $config;
# This line should prevent issue 21
$config = "etc/dummy.config.xml" unless -e $config;

# Module directory
use lib "/opt/Seccubus/SeccubusV2";
push (@main::INC, @INC);

$VERSION = '2.0.beta6';

use strict;
use Carp;
#use SeccubusConfig;
use SeccubusHelpers;

push (@main::INC, @INC);
$ENV{REMOTE_USER} = "admin" unless $ENV{REMOTE_USER};		# Run as admin user if the web server auth is not setup
check_config();

sub get_config() {
	if ( ! ref($config) ) {
		$config = XMLin($config);
	}
	return $config;
}

# Close the PM file.
return 1;

