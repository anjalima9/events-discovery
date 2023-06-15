class HomesController < ApplicationController
  skip_before_action :only_signed_in,only: [:home]
  before_action :only_signed_out, only: [:home]

  def home
    render layout: false
  end

end
