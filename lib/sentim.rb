# frozen_string_literal: true

require_relative 'sentim/version'

# SentimApi text validation
module Sentim
  autoload :Client, 'sentim/client'
  autoload :Error, 'sentim/error'
  autoload :Object, 'sentim/object'

  autoload :Result, 'sentim/objects/result'
  autoload :Sentences, 'sentim/objects/sentences'
end
