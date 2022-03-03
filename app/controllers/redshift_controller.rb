require 'redshift/client'

class RedshiftController < ApplicationController
  def show
    ENV['REDSHIFT_URL'] = 'redshift://purple_ferret:%3EEwlMXr%3A5uClSVO1@purple-ferret-eromt.coqw6amimicq.us-east-1.redshift.amazonaws.com:5439/redshift'
    Redshift::Client.establish_connection
    @redshift_date = Redshift::Client.connection.exec("SELECT GETDATE()").first
  rescue StandardError => e
    @redshift_date = e
  end
end
