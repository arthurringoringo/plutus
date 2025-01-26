# config/initializers/content_security_policy.rb

Rails.application.configure do
  config.content_security_policy do |policy|
    policy.default_src :self, :https
    policy.font_src :self, :https
    policy.img_src :self, :https, :data # Adjust as needed
    policy.object_src :none

    # Use nonces for scripts and styles
    policy.script_src :self, :https, -> { "'nonce-#{SecureRandom.base64(16)}'" } # Use generator for dynamic nonces
    policy.style_src :self, :https, -> { "'nonce-#{SecureRandom.base64(16)}'" }  # Use generator for dynamic nonces

    # Specify URI for violation reports (optional)
    # policy.report_uri "/csp-violation-report-endpoint"
  end

  # Generate session nonces for permitted importmap and inline scripts
  config.content_security_policy_nonce_generator = ->(request) { SecureRandom.base64(16) }
  config.content_security_policy_nonce_directives = %w[script-src style-src]

  # Uncomment the following line if you want to debug violations without enforcing
  # config.content_security_policy_report_only = true
end
