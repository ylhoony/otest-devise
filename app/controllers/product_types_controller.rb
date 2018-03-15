class ProductTypesController < ApplicationController
  before_action :require_signed_in?, :has_current_company?
end
