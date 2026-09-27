# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.7.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.7.0/asc_5.7.0_macOS_arm64'
      sha256 'dc6a75cb1996e29275de3c8671a6d7513b0f995abef6b79c4a8619e828f0a086'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.7.0/asc_5.7.0_macOS_amd64'
      sha256 'c16f8aaef3f3d51dd6d299e7588f2aa6968ac7595391938e38967850ee0b54ea'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.7.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.7.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
