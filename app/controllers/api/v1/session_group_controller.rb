module Api
  module V1
    class SessionGroupController < ApplicationController
      before_action :restrict_access

      def show
        session = SessionGroup.find_by(slug: session_group_params[:slug])

        if session.present?
          render jsonapi: session
        else
          render json: {}, status: 404
        end
      end

      def new_session 
        new_group = SessionGroup.new

        if new_group.save
          render jsonapi: new_group 
        else
          render jsonapi_errors: new_group.errors
        end
      end

      private

      def session_group_params
        params.permit(:slug)
      end

      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
        end
      end
    end
  end
end
