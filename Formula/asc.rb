# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.5.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.5.1/asc_1.5.1_macOS_arm64'
      sha256 'bca3e36b093b6b1c88652fbabe5cd63e3dcfa7f9597f9063f2a5042cc2a84697'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.5.1/asc_1.5.1_macOS_amd64'
      sha256 '884f24e74e79d85a5c06916e790183a16bfe042518fa75e5b5697b33c9c3d248'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.5.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.5.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
