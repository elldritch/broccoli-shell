Plugin = require 'broccoli-plugin'
Promise = require 'bluebird'
{exec, cd, pwd} = require 'shelljs'
execAsync = Promise.promisify exec

class BroccoliShell extends Plugin
  constructor: (args...) ->
    unless @ instanceof BroccoliShell
      return new BroccoliShell args...

    if args.length is 2
      [inputNodes, options] = args
    else
      inputNodes = []
      options = args[0]

    _command = options?.command
    @pwd = options?.pwd
    throw new Error 'broccoli-shell requires option `command`' unless _command

    if typeof _command is 'string'
      @command = -> _command
    else
      @command = _command

    super inputNodes, options

  build: ->
    originalDir = pwd()
    cd @pwd if @pwd
    console.log @command @outputPath
    execAsync @command @outputPath
      .then -> cd originalDir

module.exports = BroccoliShell
