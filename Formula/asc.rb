# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.10.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.10.0/asc_4.10.0_macOS_arm64'
      sha256 'a1d47bf80756558caef984f62ece891809f06d8f6e36f00ebd9d1acae81e2320'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.10.0/asc_4.10.0_macOS_amd64'
      sha256 'b1b90d3479652179489dfab65583e5470433ce62bf8d1b4ad31d259161bc5c59'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.10.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.10.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
