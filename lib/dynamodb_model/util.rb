require 'logger'

module DynamodbModel::Util
  # Ensures trailing slash
  # Useful for appending a './' in front of a path or leaving it alone.
  # Returns: '/path/with/trailing/slash/' or './'
  @@root = nil
  def root
    return @@root if @@root
    @@root = ENV['PROJECT_ROOT'].to_s
    @@root = '.' if @@root == ''
    @@root = "#{@@root}/" unless @@root.ends_with?('/')
    @@root
  end
end
