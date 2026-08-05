# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '3.5.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.5.1/asc_3.5.1_macOS_arm64'
      sha256 'e23d8ce1c93d5091efec59f2487075da5183bbe088e2d7ee393201370c615423'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.5.1/asc_3.5.1_macOS_amd64'
      sha256 '58cb2d1c066defd498eadc7b56b7c58216a34235e11f047ee8f50caf640ba892'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_3.5.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_3.5.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
