# Basic Server Profiles

# This profile should be included on all Linux machines. If you need to deactivate any
# of these basic profiles, this must be controlled via Hiera so that we can modify this
# profile without excluding machines from it. This would create unnecessary maintenance
# work for everyone who manages roles not using this profile.

# The base profile should include component modules that will be on all nodes
class profile::base {
 # Do not add any parameters here - All control of base profiles needs to happen
 # in those profiles using Hiera
 # include profile::aaaaargh
}
