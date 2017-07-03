# encoding: utf-8
# vim: ft=ruby expandtab shiftwidth=2 tabstop=2

require 'spec_helper'
require 'shellwords'

if $conf['wp_i18n_tools'] then
  describe file("/home/"+$conf['user']+"/.wp-i18n/makepot.php") do
    let(:disable_sudo) { true }
    it { should be_file }
  end
end

describe file('/vagrant/Movefile') do
  let(:disable_sudo) { true }
  it { should be_file }
end

commands = [
  "composer --version",
  "wp help",
]

commands.each do |command|
  describe command('su -l '+$conf['user']+' bash -lc "' + command + '"') do
    let(:disable_sudo) { true }
    its(:exit_status) { should eq 0 }
  end
end

$conf['composers'].each do |c|
  composer = c.split( ":" )[0]
  describe command('su -l '+$conf['user']+' bash -lc "composer global show -i ' + composer + '"') do
    let(:disable_sudo) { true }
    its(:exit_status) { should eq 0 }
  end
end

$conf['ruby_gems'].each do |gem, version|
  describe command('su -l '+$conf['user']+' bash -lc "' + gem + ' help"') do
    let(:disable_sudo) { true }
    its(:exit_status) { should eq 0 }
  end
end

$conf['wp_cli_packages'].each do |wp|
  package = wp.split( ":" )[0]
  describe command('su -l '+$conf['user']+' bash -lc "wp package path ' + package + '"') do
    let(:disable_sudo) { true }
    its(:exit_status) { should eq 0 }
  end
end
