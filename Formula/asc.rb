# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.1.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.1.0/asc_4.1.0_macOS_arm64'
      sha256 'f151e4873a9c2dc7a422d48d0034a7b4ba79eabfe49248e1dacbf47f2dde5816'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.1.0/asc_4.1.0_macOS_amd64'
      sha256 '72da5d42d69153554c63753a58866d726e6527bafffaaa34cac0b9b32d870d5a'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.1.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.1.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
