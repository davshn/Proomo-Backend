if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage    = :aws
      config.aws_bucket = "twenti"
      config.aws_acl    = 'public-read'

      # The maximum period for authenticated_urls is only 7 days.
      config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

      # Set custom options such as cache control to leverage browser caching
      config.aws_attributes = {
        expires: 1.week.from_now.httpdate,
        cache_control: 'max-age=604800'
      }

      config.aws_credentials = {
        access_key_id:     "AKIAIN5G7JEF42HKWALA",
        #secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
	secret_access_key: "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",
        region:            "us-west-2", # Required
        stub_responses:    Rails.env.test? # Optional, avoid hitting S3 actual during tests
      }
    end
end
