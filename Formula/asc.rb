# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.5.3'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.5.3/asc_1.5.3_macOS_arm64'
      sha256 '7c93b698a50ffbbc4c8b1f3513c1716fb402ac30c9733e30172c1fa2525265fa'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.5.3/asc_1.5.3_macOS_amd64'
      sha256 '9e3b7f87311257477487282e6bf52b88a09c4b3758f72d6be91165c498638bc2'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.5.3_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.5.3_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
