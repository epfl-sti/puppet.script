# script

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with script](#setup)
    * [What script affects](#what-script-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with script](#beginning-with-script)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

The script module makes it easy to distribute ad-hoc scripts to Puppet agents.

## Module Description

The script module lets you create scripts in your Puppet code as easily as this:

~~~
script { "foo.pl":
  ensure => present,
  language => "perl",
  content => template("mymodule/foo.pl")
}
~~~

You can then just create `mymodule/templates/foo.pl`. You may use
[Puppet templating](https://docs.puppetlabs.com/guides/templating.html)
escapes like `<% %>` and `<%= %>`, but you don't have to.

In order to execute the script, you can just say

~~~
exec { "$script::dir/foo.pl":
   onlyif => "$(hostname) == 'zoinx'",  # Optional
   require => Script["foo.pl"]
}
~~~

or even better, you can combine the two declarations like this:

~~~
script { "foo.pl":
   # [...]
} -> exec { "$script::dir/foo.pl":
   onlyif => "$(hostname) == 'zoinx'"
}
~~~

## Setup

### What script affects

* Adds a `script/` directory into Puppet's `vardir`.

### Beginning with script

The very basic steps needed for a user to get the module up and running.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you may wish to include an additional section here: Upgrading
(For an example, see http://forge.puppetlabs.com/puppetlabs/firewall).

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
