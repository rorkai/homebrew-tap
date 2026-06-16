# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '2.1.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.1.0/asc_2.1.0_macOS_arm64'
      sha256 'cbdec8be1117d8bf1bd33c9889ac82e01a464af93db19511ef6648a2091348f5'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.1.0/asc_2.1.0_macOS_amd64'
      sha256 '17c11841e7a620044140060e93f80140a0d4f7c03aefe3504efb6a116c0eaf37'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_2.1.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_2.1.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
