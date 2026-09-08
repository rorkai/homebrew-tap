# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.1.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.1.0/asc_5.1.0_macOS_arm64'
      sha256 'dc5d5a720e124d90d10111c4c2378db48bd4e1cd4039bd653c7818c3cf06c935'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.1.0/asc_5.1.0_macOS_amd64'
      sha256 'e1b7ea538a9312d9a94523faf8b7ac74fe8bfa5ac8c93e65206eb3602b27212e'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.1.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.1.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
