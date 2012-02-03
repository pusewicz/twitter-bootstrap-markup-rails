describe "README.md" do
  let(:version) {
    require File.expand_path("../../../lib/twitter-bootstrap-markup-rails/version",
                             __FILE__)
    Twitter::Bootstrap::Markup::Rails::VERSION
  }

  subject { File.read(File.expand_path("../../../README.md", __FILE__)) }

  it "contains correct version number in gem declaration" do
    subject.should include("gem 'twitter-bootstrap-markup-rails', '#{version}'")
  end
end

