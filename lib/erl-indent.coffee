{CompositeDisposable} = require 'atom'
{exec} = require 'child_process'
Shell = require 'shell'

module.exports =

  config:
    indent_bin:
      type: 'string'
      default: '/usr/local/bin/erl-indent'

  activate: ->
    atom.commands.add 'atom-workspace', 'erlang:indent': => @indent()


  deactivate: ->
    @disposable?.dispose()
    @disposable = null

  indent: ->
    editor = atom.workspace.getActivePaneItem()
    file = editor?.buffer.file
    filePath = file?.path
    bin = atom.config.get('erl-indent.indent_bin')
    exec (bin + ' ' + filePath)
