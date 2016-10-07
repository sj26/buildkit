module Buildkit
  class Client
    # Methods for the Pipelines API
    #
    # @see https://buildkite.com/docs/api/pipelines
    module Pipelines
      # List pipelines
      #
      # @return [Array<Sawyer::Resource>] Array of hashes representing Buildkite pipelines.
      # @see https://buildkite.com/docs/api/pipelines#list-pipelines
      # @example
      #   Buildkit.pipelines('my-great-org')
      def pipelines(org, options = {})
        get("/v1/organizations/#{org}/pipelines", options)
      end

      def pipelines(*args) # :nodoc:
        warn "#projects is deprecated and has been renamed #pipelines"
        pipelines(*args)
      end

      # Get a pipeline
      #
      # @param org [String] Organization slug.
      # @param pipeline [String] Pipeline slug.
      # @return [Sawyer::Resource] Hash representing Buildkite pipeline
      # @see https://buildkite.com/docs/api/pipelines#get-a-pipeline
      # @example
      #   Buildkit.pipeline('my-great-org', 'great-pipeline')
      def pipeline(org, pipeline, options = {})
        get("/v1/organizations/#{org}/pipelines/#{pipeline}", options)
      end

      def project(*args) # :nodoc:
        warn "#project is deprecated and has been renamed #pipeline"
        pipeline(*args)
      end
    end
  end
end
