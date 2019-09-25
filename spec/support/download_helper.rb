module DownloadHelper
  TIMEOUT = 10
  PATH    = Rails.root.join('tmp/downloads')

  module_function

  def downloads
    Dir[PATH.join('*')]
  end

  def download
    downloads.first
  end

  def download_content
    wait_for_download
    File.read(download)
  end

  def wait_for_download
    Timeout.timeout(TIMEOUT) do
      sleep 0.1 until downloaded?
    end
  end

  def downloaded?
    !downloading? && downloads.any?
  end

  def downloading?
    downloads.grep(/\.crdownload$/).any?
  end

  def clear_downloads
    FileUtils.rm_f(downloads)
  end
end

RSpec.configure do |config|
  config.include DownloadHelper, type: :system
  config.before(:suite) { Dir.mkdir(DownloadHelper::PATH) unless Dir.exist?(DownloadHelper::PATH) }
  config.after(:example, type: :system) { clear_downloads }
end
