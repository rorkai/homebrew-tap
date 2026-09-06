# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.0.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.0.0/asc_5.0.0_macOS_arm64'
      sha256 '7e1d5dfafa053555f4db63478dbcba6f2a39b1563b2171ca3f4b6404f27afbb0'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.0.0/asc_5.0.0_macOS_amd64'
      sha256 'b5ce1901558f26b56fe2dd08138e760d647f2772a8e75047197e0ef5b2199263'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.0.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.0.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
