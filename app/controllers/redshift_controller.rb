require 'redshift/client'

class RedshiftController < ApplicationController
  def show
    Redshift::Client.establish_connection
    @redshift_date = Redshift::Client.connection.exec("SELECT GETDATE()").first
  rescue StandardError => e
    @redshift_date = e
  end
end
