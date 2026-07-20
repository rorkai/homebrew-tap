# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '3.1.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.1.1/asc_3.1.1_macOS_arm64'
      sha256 '47d9be058359ab29c4f562361abfed710b7f24acdaa79c78777bc6e25e118fef'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.1.1/asc_3.1.1_macOS_amd64'
      sha256 '8fbb62de183d62828bf94a433d446bcc5dfd3b26f51de9d4105200df9aacd806'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_3.1.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_3.1.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
