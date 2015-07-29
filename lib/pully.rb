require 'git'

class Pully
  attr_reader :git

  def self.open
    new.open
  end

  def initialize
    dir  = '.'
    dir += '/..' until File.directory?("#{dir}/.git")
    @git = Git.open(dir)
  end
end
