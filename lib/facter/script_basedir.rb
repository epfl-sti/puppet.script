# == Fact: script_basedir
#
# A custom fact that sets the default location for scripts
#
# "${::vardir}/script/"
#
Facter.add("script_basedir") do
  setcode do
    File.join(Puppet[:vardir], "script")
  end
end
