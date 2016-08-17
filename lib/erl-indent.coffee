{BufferedProcess, CompositeDisposable} = require 'atom'
{exec} = require 'child_process'
path = require 'path'
fs = require 'fs'


module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'erlang:indent': => @indent()

  deactivate: ->
    @disposable?.dispose()
    @disposable = null

  indent: ->
    command = path.join path.resolve(path.dirname(fs.realpathSync __filename) , '../scripts'), 'erl-indent'
    editor = atom.workspace.getActiveTextEditor()
    return unless editor

    args = [editor.getPath()]
    stdout = (output) -> console.log(output)
    stderr = (output) -> console.log(output)
    exit = (code) -> console.log("erl-indent exited with #{code}")
    process = new BufferedProcess({command, args, stdout, exit})
