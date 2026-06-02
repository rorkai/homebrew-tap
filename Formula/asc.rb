# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.9.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.9.1/asc_1.9.1_macOS_arm64'
      sha256 'ca218ca9845b8c70ca13ce7fe74131569c79da61e92a711d4b285c387f517315'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.9.1/asc_1.9.1_macOS_amd64'
      sha256 '4b5f83f9cfe8b8921bdade9e094cee184736e7dd85f481c4fe3c7105e33de419'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.9.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.9.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
