unless Rails.respond_to?(:gem_version)
  module Rails
    def self.gem_version
      Gem::Version.new VERSION::STRING
    end
  end
end

%w(4.2.0 4.1.0 4.0.0 ).each{|version| Object.const_set("RAILS_V#{version.gsub('.', '_')}", Gem::Version.new(version)) }