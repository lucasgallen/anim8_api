module Api
  module V1
    class SharedImageController < ApplicationController
      before_action :restrict_access

      def update
        session = SessionGroup.find_by(slug: shared_image_params[:slug])

        if session.shared_image.update!(data_url: shared_image_params[:data_url])
          render jsonapi: session.shared_image
        else
          render jsonapi: session.shared_image.errors
        end
      end

      private

      def shared_image_params
        params.permit(:data_url, :slug)
      end

      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
        end
      end
    end
  end
end
