# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '7.3.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.3.0/asc_7.3.0_macOS_arm64'
      sha256 '866a26f0fddfbd6cee346cd465cdb23a59c7af8120034e62132d6b6ddb90b4f1'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.3.0/asc_7.3.0_macOS_amd64'
      sha256 'f3fea03c638dd2dc234c1f00c498a3f1a7ddad8944e5169d1628ed4fe192b11c'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_7.3.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_7.3.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
