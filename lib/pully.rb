require 'git'
require 'uri'
require 'uri/ssh_git'

class Pully
  attr_reader :git, :branch, :remote

  def self.open
    new.open
  end

  def initialize
    dir  = '.'
    dir += '/..' until File.directory?("#{dir}/.git")
    @git = Git.open(dir)
    @branch = Git::Lib.new.send(:command, 'rev-parse --abbrev-ref HEAD')
    @remote = process_remote(git.config["remote.origin.url"])
  end

  def open
    link = "#{remote.gsub('.git', '')}/compare/#{branch}?expand=1"
    if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/
      system "start #{link}"
    elsif RbConfig::CONFIG['host_os'] =~ /darwin/
      system "open #{link}"
    elsif RbConfig::CONFIG['host_os'] =~ /linux|bsd/
      system "xdg-open #{link}"
    end
  end

  private

  def process_remote(remote)
    begin
      URI.parse(remote)
      return remote
    rescue URI::InvalidURIError
      uri = URI::SshGit.parse(remote)
      return "https://#{uri.host}#{uri.path}"
    end
  end
end
