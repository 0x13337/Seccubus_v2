Seccubus V2 Change Log
======================

Seccubus V2 is currently in early Beta phase. This code is currently actively
maintained and developed and is the recommended branch. It works with
Nessus 4.x with both a home feed and professional feed license.

If you are looking for stable code you might want to use the V1 branch of this
project, but be aware that it only supports Nessus with a professional feed
and is not longer under active development.

11-10-2012 - 2.0.beta6 - The final Beta
=======================================

New features / Issues resolved
------------------------------
* Sourcecode repository is now
  [GitHub] (https://github.com/schubergphilis/Seccubus_v2/issues/6) in stead of   SourceForge
* Build is now automated using a Jenkins server at Schuberg Philis including
  the creation of RPMs via OpenSuse build services
* Fixed a few bugs
    
Bigs fixed (tickets closed):
----------------------------
* #7  - Import error on scan results from OpenVAS 3.0.1
* #7  - Error converting OpenVAS .nbe to IVIL
* #11 - ConfigTest is more verbose when it fails due to a missing config file
* #12 - Installation error with tarball
* #15 - Ungroup Compliance Scans
* #16 - More gracefull error handling when Nikto doesn't find a config
* #17 - File ~/scanners/Nikto/scan has no execute permission
* ##  - Fixed a broken symlink in the development environment
* #23 - Nessus xmlRPC port can now be selected
* #25 - Fixed tarball installation error
* #29 - JMVC framework updated to version 3.2.2
    
15-8-2012 - 2.0.beta5 
=====================
This is basically version 2.0.beta4 with a nasty critical error removed.

New features / Issues resolved
------------------------------
Removed an error that caused the previous version to fail

Bigs fixed (tickets closed):
----------------------------
91 - Scan_ids is a mandatory parameter

10-6-2012 - 2.0.beta4 
=====================

New features / Issues resolved
------------------------------
Fixed major performance issues
Fixed installer bug

Bigs fixed (tickets closed):
----------------------------
82 - Install.pl fails to write all necesary files
83 - convert_v2_v2 does not work with default install directory from RPM (/var/lib/seccubus)
84 - getWorkspaces slow with large database
85 - getScans slow with large databases
86 - getFindings slow with workspaces with lots of findings

14-3-2012 - 2.0.beta3 (a.k.a. the Blackhat edition)
==================================================

New features / Issues resolved
------------------------------
* Nessus5 tested and found compatilble
* Findings can now be opened and edited individually
* The edit finding dialog shows the change history of the finding
* Long(ish) findings now render with a more link that allows you to expand the
  the finding, causing the findigns table to generally dispaly more compact.
* Clarified the purpose of status buttons, filters and bul update form in GUI.
* Added the capability to filter on severity, finding text and remark text
* Added the ability for scan scripts to add attachments to runs
* All scan scripts add attachments to runs
* Script to convert Seccubus v1 data to V2 data adds attachments to runs
* Scan history can now be viewed in the GUI and attachments can be dowloaded
* IP numbers now sort correctly
* Restyled status buttons and edit button
* Removed www/oldstyle GUI
* Removed Seccubus.Scan.List

Bigs fixed (tickets closed):
----------------------------
60 - Not all items from a Nikto scan appear to create a finding in Seccubus
https://sourceforge.net/apps/trac/seccubus/ticket/60
62 - Default locations for config.xml does not include ~seccubus/etc/config.xml
https://sourceforge.net/apps/trac/seccubus/ticket/62
67 - Links in top right of UI do nothing
https://sourceforge.net/apps/trac/seccubus/ticket/67
71 - Scan result should "window shade" in the UI to hide lengthy text
https://sourceforge.net/apps/trac/seccubus/ticket/71
75 - Bulk update: Comments only get added when you select overwrite
https://sourceforge.net/apps/trac/seccubus/ticket/75
74 - Minor bugs in nmap2ivil when using nmap 5.21
https://sourceforge.net/apps/trac/seccubus/ticket/74

17-01-2012 - 2.0.beta2
======================
New features / Issues resolved
------------------------------
Workspace management tab
* Create workspaces
* Modify workspaces
Scan management tab
* Create scans
* Edit scans
Developer documentation updated
End user documentation updated

Bigs fixed (tickets closed):
----------------------------
62 - Default locations for config.xml does not include ~seccubus/etc/config.xml
https://sourceforge.net/apps/trac/seccubus/ticket/62
57 - Scan names with two words not handled correctly
https://sourceforge.net/apps/trac/seccubus/ticket/57
54 - Scanner selection wasn;t dynamic in the GUI
https://sourceforge.net/apps/trac/seccubus/ticket/54
53 - nessus2ivil still contains references to nbe
https://sourceforge.net/apps/trac/seccubus/ticket/53

07-01-2012 - 2.0.beta1
======================
New features / Issues resolved
------------------------------
With this release Seccubus goes into BETA phase. It also marks the end of
active development for Seccubus V1 (last current version is 1.5.5)
Seccubus V1 is still maintained at a minimum level, meaning that if bugs are
found and they are not too complex to fix, they will be fixed, but no new
features will be added to the V1 branch of the product.

GUI rewrite
-----------
Old GUI is in /oldstyle
Complete GUI code was rewritten using JMVC framework
Those www api calls needed to make this current GUI work have been rewritten
to JSON
New, less confusing, layout of Findings screen

Bigs fixed (tickets closed):
----------------------------
49 - Incorrect status selection possible in GUI for Gone findings
https://sourceforge.net/apps/trac/seccubus/ticket/49
58 - Cannot give GONE findings the status CLOSED 
https://sourceforge.net/apps/trac/seccubus/ticket/58


23-11-2011 - 2.0.alpha5
=======================
New features / Issues resolved
------------------------------
Perl compile tests and JMVC unit tests are now part to the build process
In the RPM install files in the scanner directories did not run because of
incorrect permissions (fixed)
All scanners but Nessus were broken due to an untested fix by the author

GUI rewrite
-----------
New GUI is in /seccubus/seccubus.html
First parts of the GUI rewritten using JMVC framework
Updated JMVC to get more clear build errors
Integrated JMVC building into the distribution building scripts

Bigs fixed (tickets closed):
----------------------------
#55 - Spec file is missing dependancies
https://sourceforge.net/apps/trac/seccubus/ticket/55
#56 - Scanner files not executable after install
https://sourceforge.net/apps/trac/seccubus/ticket/56
#59 - Nikto scanner not running
https://sourceforge.net/apps/trac/seccubus/ticket/59

13-09-2011 - 2.0.alpha4
=======================
New features / Issues resolved
------------------------------

### Nmap support
Scanning with is supported from the same server that is running the Nessus
Seccubus GUI
### The results of the Nessus Policy Compliance family of plugins is now
supported
These plugins are different in the sense that they return multiple results
all direntified by a single pluginID

Bigs fixed (tickets closed):
----------------------------
#8 - Integrate nmap scans into Seccubus
https://sourceforge.net/apps/trac/seccubus/ticket/8
#50 - scanners/nessus/scan should give a clear error message when ruby is
not on system
http://sourceforge.net/apps/trac/seccubus/ticket/50

15-08-2011 - 2.0.alpha3
=======================
New features / Issues resolved
* Major bug in the delta engine resolved. It turned out that statusses where
  not processed after a scan, but was called by the load_ivil utility.

Bugs fixed:
-----------
#36 - Nessus scans don't seem to see targets
https://sourceforge.net/apps/trac/seccubus/ticket/36
#12 - Gone hosts not not detected correctly
https://sourceforge.net/apps/trac/seccubus/ticket/12
#42 - Scan parameters --workspace and --scan should be added automatically
https://sourceforge.net/apps/trac/seccubus/ticket/42

17-03-2011 - 2.0.alpha2 
=======================
New features / Issues resolved
------------------------------
Fixed slow speed of updates to multiple findings  
Scanning with Nessus should work a lot better in this version

Bug fixed:
----------
#30 - Document running scans
https://sourceforge.net/apps/trac/seccubus/ticket/30
#32 - load_ivil command line argument 'scan' is ignored
https://sourceforge.net/apps/trac/seccubus/ticket/32
#34 - Default port for OpenVAS scanning not set correctly
https://sourceforge.net/apps/trac/seccubus/ticket/34
#35 - ivil does not import title of Nessus finiding
https://sourceforge.net/apps/trac/seccubus/ticket/35
#37 - @HOSTS gets expanded to /tmp/seccus.hosts.PID in stead of
/tmp/seccubus.hosts.PID
https://sourceforge.net/apps/trac/seccubus/ticket/37
#38 - nessus2ivil should not die on unknown attribute
https://sourceforge.net/apps/trac/seccubus/ticket/38

15-03-2011 - 2.0.alpha1 - First internal alpha release
======================================================
