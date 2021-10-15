# frozen_string_literal: true

require_relative 'sentim/version'

# SentimApi text validation
module Sentim
  autoload :Client, 'sentim/client'
  autoload :Error, 'sentim/error'
  autoload :Object, 'sentim/object'
  autoload :Resource, 'sentim/resource'

  autoload :SentimentValidation, 'sentim/resources/sentiment_validation'
  autoload :ValidatedText, 'sentim/objects/validated_text'
end
