# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def action; end
  #定義の追加→application_controller.rb
  add_flash_types :success, :info, :warning, :danger  
end
