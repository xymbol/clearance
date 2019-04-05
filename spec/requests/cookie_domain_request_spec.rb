require "spec_helper"

describe "A request with cookie_domain set" do
  before do
    host! 'not-example.com'
    Clearance.configure do |config|
      config.cookie_domain = 'not-example.com'
    end
  end

  it "maintains a session between requests" do
    user = create(
      :user,
      email: "email@example.com",
      password: "password",
    )

    get sign_in_path
    # puts response.body
    # puts response.cookies
    # puts response.headers
    # puts "---"

    post session_path,
      params: {
        session: {
          email: "email@example.com",
          password: "password",
        }
      }
    puts response.body
    puts response.cookies.each(&:inspect)
    puts response.headers
    puts "---"
    expect(response).to redirect_to(root_path)

    follow_redirect!
    puts response.body
    puts response.cookies
    puts response.headers
    puts "---"

    expect(response.body).to match("Sign out")
  end
end
