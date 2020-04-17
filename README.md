# LogParser

## Description
Test task for Smart Pension

## How to install

Requirements: `ruby 2.6.0, bundler`

Clone this repo
```
$ git clone https://github.com/rkugot/log_parser.git
```
Go to log_parser directory and run
```
$ bundle install
```

## Usage
Grant permissions:
```
$ chmod +x bin/parser
```
Run app:
```
$ ./bin/parser public/webserver.log
```

## Running specs
```
$ rspec
```

## Approach description
- Using OOP, TDD and SOLID
- Validates file existence and presence of file content
- Capability to add new log processing

## Possible Improvements
 - Read log file in chunks, don't load all file in memory
 - Extend validations
 - Capability to read multiple files at a time