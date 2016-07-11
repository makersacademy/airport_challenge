module.exports =
  config:
    enableForIndentation:
      type: 'boolean'
      default: false
      description: 'Enable highlight for lines containing only indentation'
    enableForCursorLines:
      type: 'boolean'
      default: false
      description: 'Enable highlight for lines containing a cursor'
  
  activate: (state) ->
    # Observe "Enable For Indentation" config setting
    atom.config.observe 'trailing-spaces.enableForIndentation', (enable) ->
      if enable
        document.body.classList.add('trailing-spaces-highlight-indentation')
      else
        document.body.classList.remove('trailing-spaces-highlight-indentation')
    
    # Observe "Enable For Cursor Lines" config setting
    atom.config.observe 'trailing-spaces.enableForCursorLines', (enable) ->
      if enable
        document.body.classList.add('trailing-spaces-highlight-cursor-lines')
      else
        document.body.classList.remove('trailing-spaces-highlight-cursor-lines')

