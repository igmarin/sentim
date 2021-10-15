# frozen_string_literal: true

module Sentim
  # SentimentValidation validate
  class SentimentValidation < Resource
    def validate(**attributes)
      response = post_request('/api/v1/', body: attributes).body
      ValidatedText.new response
    end
  end
end
