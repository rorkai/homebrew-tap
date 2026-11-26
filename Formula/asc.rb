# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '7.6.1'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.6.1/asc_7.6.1_macOS_arm64'
      sha256 '6a5ced924158b3f539516761ced6986edfb663ff1c2a8554c126123abd0190b8'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.6.1/asc_7.6.1_macOS_amd64'
      sha256 '4b67ba0a958d2f27a681435095843f29607834e1656a6fefb480cd1f3d132347'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_7.6.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_7.6.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
