class RowsController < ApplicationController
  before_action :authenticate_user!

  def create
    ActiveRecord::Base.connection.execute(mass_insert_sql)
    render nothing: true
  end

private

  def row_params
    params.require(:row)
  end

  def mass_insert_sql
    date = ", '#{Time.now.to_s[0..-7]}'"*2 + ")"
    rows = row_params.gsub(/\)/, date)
    "INSERT INTO rows (user_id, filename, col1, col2, col3, col4, col5, col6, col7, created_at, updated_at) VALUES #{rows}"
  end

end
