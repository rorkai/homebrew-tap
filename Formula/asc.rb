# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '7.2.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.2.0/asc_7.2.0_macOS_arm64'
      sha256 '4d1c817b581b83e5f0f83570e43deee692a08384dce4a7c153bf85a06ef0a56e'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.2.0/asc_7.2.0_macOS_amd64'
      sha256 '400625e6750f3032cc11271244b13717d4cb8f3036cc4afc95563b7a44e7f993'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_7.2.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_7.2.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
