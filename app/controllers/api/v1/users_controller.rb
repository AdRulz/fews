module Api::V1
  class UsersController < BaseController
    before_filter :set_cache_buster
    load_and_authorize_resource
    actions :show
  end
end
