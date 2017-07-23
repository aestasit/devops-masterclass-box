#!/usr/bin/env bats

setup() {
  rm -rf /tmp/test.file
}

@test "verify jq version" {
  result="$(jq --version)"
  [ "$result" = 'jq-1.5' ]
}

@test "verify puppet" {
  [ ! -f /tmp/test.file ]  
  run /opt/puppetlabs/bin/puppet apply -e 'file { "/tmp/test.file": content => "abc" }'
  echo "$output" > /tmp/puppet.output
  [ "$status" -eq 0 ]
  [ -f /tmp/test.file ]
}

@test "verify puppet with modules" {
  run sudo /opt/puppetlabs/bin/puppet module install puppetlabs-apache --version 1.11.0
  echo "$output" > /tmp/puppet-module.output
  [ "$status" -eq 0 ]  
  run sudo /opt/puppetlabs/bin/puppet apply -e 'include apache'
  echo "=======================" >> /tmp/puppet-module.output
  echo "$output" >> /tmp/puppet-module.output
  [ "$status" -eq 0 ]
  result="$(netstat -an | grep LISTEN | grep :80 | wc -l)"
  [ "$result" -eq 1 ] 
}

@test "verify r10k" {
  run /opt/puppetlabs/bin/r10k 
  [ "$status" -eq 0 ]
}

@test "verify docker" {
  run docker --version
  [ "$status" -eq 0 ]
}

@test "verify docker-compose" {
  run docker-compose --version
  [ "$status" -eq 0 ]
}

@test "verify ansible" {
  run ansible --version
  [ "$status" -eq 0 ]
}

@test "verify fabric" {
  run fab --version
  [ "$status" -eq 0 ]
}

@test "verify groovy" {
  run groovy --version
  [ "$status" -eq 0 ]
}

@test "verify java" {
  run java -version
  [ "$status" -eq 0 ]
}

@test "verify aws" {
  run aws --version
  [ "$status" -eq 0 ]
}
