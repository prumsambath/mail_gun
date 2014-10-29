class IncomingController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    puts "incoming params here: #{params}"
    head 200
  end
end
