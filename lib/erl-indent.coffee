{CompositeDisposable} = require 'atom'
{exec} = require 'child_process'
Shell = require 'shell'
path = require 'path'
fs = require 'fs'

module.exports =

  activate: ->
    atom.commands.add 'atom-workspace', 'erlang:indent': => @indent()

  deactivate: ->
    @disposable?.dispose()
    @disposable = null

  indent: ->
    editor = atom.workspace.getActivePaneItem()
    file = editor?.buffer.file
    filePath = file?.path

    # use indent_bin from the current project
    current_dir = path.dirname fs.realpathSync __filename
    scripts_dir = path.resolve current_dir, '../scripts'
    indent_bin = path.join scripts_dir, 'erl-indent'
    exec indent_bin + ' ' + filePath
