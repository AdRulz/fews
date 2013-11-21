module Api::V1
  class UsersController < BaseController
    load_and_authorize_resource
    actions :show
  end
end
