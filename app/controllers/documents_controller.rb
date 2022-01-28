class DocumentsController < ApplicationController
  def index
    @bucket_name = ENV['S3_BUCKET_NAME']
    s3 = Aws::S3::Client.new
    @documents = s3.list_objects(bucket: ENV['S3_BUCKET_NAME']).contents.map do |obj|
      obj.key
    end
  end

  def create
    s3 = Aws::S3::Client.new
    s3.put_object(
      bucket: ENV['S3_BUCKET_NAME'],
      key: params[:document].original_filename,
      body: params[:document]
    )

    redirect_to documents_path
  end

  private

  def get_s3_bucket
    credentials = Aws::Credentials.new(ENV['S3_ACCESS_KEY_ID'], ENV['S3_SECRET_ACCESS_KEY'])
    s3 = Aws::S3::Client.new(region: ENV['AWS_REGION'])
  end
end
