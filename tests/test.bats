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
  [ ! -f /tmp/test.file ]  
  run /opt/puppetlabs/bin/puppet apply -e 'file { "/tmp/test.file": content => "abc" }'
  echo "$output" > /tmp/puppet.output
  [ "$status" -eq 0 ]
  [ -f /tmp/test.file ]
}

@test "verify r10k" {
  run r10k 
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
