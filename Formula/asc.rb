# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '2.1.2'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.1.2/asc_2.1.2_macOS_arm64'
      sha256 '32bb7c6a5f78d7e3d0c06c4814be5907df23cfdd521181b1f21fda7f6265df72'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.1.2/asc_2.1.2_macOS_amd64'
      sha256 '4dd8f1e8fa85088340075b092f0a8cab01d89e70bd2020079b02c2e2b2ad3b64'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_2.1.2_macOS_arm64' => 'asc'
    else
      bin.install 'asc_2.1.2_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
