rails_versions = %w(
  4.2
  5.0
  5.1
  5.2
)

rails_versions.each do |version|
  appraise "rails_#{version}" do
    gem "railties", "~> #{version}.0"
    if Gem::Version.new(version) >= Gem::Version.new("5.0")
      gem "rails-controller-testing"
    end
    gem 'shoulda-matchers', '~> 4.1'

    gem 'sqlite3', '~> 1.3.13'
    gem 'rspec-rails', '~> 3.1'
  end
end

# Rails 6 pre-release testing
# TODO - Combine with above when 6.0 is final
appraise "rails_6.0" do
  gem "railties", "~> 6.0.0.rc1"
  gem "rails-controller-testing"
  gem 'shoulda-matchers', '~> 4.1'
  gem 'sqlite3', '~> 1.4.0'

  # TODO - Switch to 4.0 gem once releaes is made
  gem 'rspec-rails', '~> 4.0.0.beta2'
end
