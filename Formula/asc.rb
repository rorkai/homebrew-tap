# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.9.3'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.9.3/asc_4.9.3_macOS_arm64'
      sha256 'd933a71cfe73bfb233bc68c17da8e372fcef2a42f0a8c32355051eb09cac4383'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.9.3/asc_4.9.3_macOS_amd64'
      sha256 '67ba4772f8bad683136193af7f1e14716508d21ed95e65eaaf7884038a876b50'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.9.3_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.9.3_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
