# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '7.7.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.7.0/asc_7.7.0_macOS_arm64'
      sha256 '2a2da469ab93123ccfa4a0d7452c1a6dc8bd39ad7d92014cb2c1769956d10127'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.7.0/asc_7.7.0_macOS_amd64'
      sha256 '0cd6b70b5f017a6218c47094069d020e0ae27b75787b689064c0756fbb76bff7'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_7.7.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_7.7.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
