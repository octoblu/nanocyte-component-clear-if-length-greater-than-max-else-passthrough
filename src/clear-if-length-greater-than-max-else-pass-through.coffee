ReturnValue = require 'nanocyte-component-return-value'
_ = require 'lodash'

class ClearIfLengthGreaterThanMaxElsePassThrough extends ReturnValue
  onEnvelope: (envelope) =>
    {config,message} = envelope

    return [] unless _.isArray message
    return message unless config.max?
    return message if config.max == 0
    return message if _.size(message) < config.max
    return []

module.exports = ClearIfLengthGreaterThanMaxElsePassThrough
